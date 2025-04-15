package com.example.shake_detection_plugin

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

class ShakeDetectionPlugin : FlutterPlugin, SensorEventListener {
  private lateinit var sensorManager: SensorManager
  private var accelerometer: Sensor? = null
  private var lastX = 0f
  private var lastY = 0f
  private var lastZ = 0f
  private var lastTime: Long = 0
  private val SHAKE_THRESHOLD = 12.0f // Shake intensity threshold
  private var shakeCount = 0 // Track number of shakes detected
  private var canShake = true // Flag to allow shake detection
  private var eventSink: EventChannel.EventSink? = null

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // Create an EventChannel to send shake events to Flutter
    val eventChannel = EventChannel(binding.binaryMessenger, "shake_detection_plugin/shake_event")
    eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
      override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        // Store the EventSink to send events later
        eventSink = events
      }

      override fun onCancel(arguments: Any?) {
        eventSink = null
      }
    })

    // Initialize the sensor manager and accelerometer
    sensorManager = binding.applicationContext.getSystemService(android.content.Context.SENSOR_SERVICE) as SensorManager
    accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)

    // Register the accelerometer sensor listener
    accelerometer?.let {
      sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_UI)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // Unregister the sensor listener when the plugin is detached
    accelerometer?.let {
      sensorManager.unregisterListener(this, it)
    }
  }

  override fun onSensorChanged(event: SensorEvent?) {
    // Process only if the event is from the accelerometer sensor
    if (event == null || event.sensor?.type != Sensor.TYPE_ACCELEROMETER) return

    val currentTime = System.currentTimeMillis()

    // Process the event if enough time has passed (to avoid spamming)
    if (currentTime - lastTime > 100) { // Check for a gap between shake events
      val diffTime = currentTime - lastTime
      lastTime = currentTime

      val x = event.values[0]
      val y = event.values[1]
      val z = event.values[2]

      // Calculate the speed (change in acceleration)
      val speed = Math.abs(x + y + z - lastX - lastY - lastZ) / diffTime * 10000

      // If the calculated speed exceeds the threshold, it's a shake
      if (speed > SHAKE_THRESHOLD && canShake) {
        shakeCount++

        // If the second shake is detected, trigger the event (send signal to Flutter)
        if (shakeCount == 2) {
          eventSink?.success(null) // Trigger the event
          shakeCount = 0 // Reset shake count after the second shake
          canShake = false // Disable further shake detection temporarily

          // After 500ms, allow shake detection again
          Thread {
            Thread.sleep(500) // Wait for 500ms before allowing another shake
            canShake = true
          }.start()
        }
      }

      // Update the previous accelerometer values for the next event
      lastX = x
      lastY = y
      lastZ = z
    }
  }

  override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
    // Not needed for this implementation
  }
}