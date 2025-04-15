import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationEx extends StatefulWidget
{
  const LocationEx({super.key});

  @override
  State<LocationEx> createState() => _LocationExState();
}

class _LocationExState extends State<LocationEx> {
  String location = "Fetching Location...";
  LocationData? locationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    geolocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("My Location"),),
      body: Center
        (
          child: Text("$location",
              style: TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold))
      ),
    );
  }

  Future<void> geolocation() async
  {
    Location locationService = Location();
    bool serviceEnabled = await locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationService.requestService();
      if (!serviceEnabled) {
        setState(() {
          location = "Location services are disabled.";
        });
        return;
      }
    }
    PermissionStatus permissionGranted = await locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        setState(() {
          location = "Location permission denied.";
        });
        return;
      }
    }
    locationData = await locationService.getLocation();
    setState(()
    {
      location =
      "Latitude: ${locationData?.latitude},\nLongitude: ${locationData
          ?.longitude}";
    });
  }
}