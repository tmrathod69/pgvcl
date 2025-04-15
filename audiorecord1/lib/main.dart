import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main()
{
  runApp(AudioRecordingApp());
}

class AudioRecordingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Recording App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioRecordScreen(),
    );
  }
}

class AudioRecordScreen extends StatefulWidget {
  @override
  _AudioRecordScreenState createState() => _AudioRecordScreenState();
}

class _AudioRecordScreenState extends State<AudioRecordScreen> {
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  bool _isRecording = false;
  String _filePath = '';
  bool _isPlaying = false;
  FlutterSoundPlayer _audioPlayer = FlutterSoundPlayer();

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
    _initializePlayer();
  }

  // Initialize the audio recorder
  Future<void> _initializeRecorder() async
  {
    await _audioRecorder.openRecorder();
  }

  // Initialize the audio player
  Future<void> _initializePlayer() async
  {
    await _audioPlayer.openPlayer();
  }

  // Start recording audio
  Future<void> _startRecording() async
  {
    final directory = await getApplicationDocumentsDirectory();
    _filePath = '${directory.path}/recorded_audio.aac';
    await _audioRecorder.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    setState(() {
      _isRecording = true;
    });
  }

  // Stop recording audio
  Future<void> _stopRecording() async {
    ;await _audioRecorder.stopRecorder();
      setState(() {
        _isRecording = false;
    });
  }

  // Play the recorded audio
  Future<void> _playAudio() async
  {
    if (_isPlaying) {
      await _audioPlayer.stopPlayer();
    } else {
      await _audioPlayer.startPlayer
        (
        fromURI: _filePath,
        codec: Codec.aacADTS,
      );
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioRecorder.closeRecorder();
    _audioPlayer.closePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recording App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _isRecording ? 'Recording in Progress...' : 'Press to Start Recording',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRecording ? _stopRecording : _startRecording,
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    size: 50,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _filePath.isEmpty ? null : _playAudio,
                  child: Icon(
                    _isPlaying ? Icons.stop : Icons.play_arrow,
                    size: 50,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
