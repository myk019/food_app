import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeolocationExample extends StatefulWidget {
  @override
  _GeolocationExampleState createState() => _GeolocationExampleState();
}

class _GeolocationExampleState extends State<GeolocationExample> {
  static const platform = MethodChannel('samples.flutter.dev/geolocation');
  String _locationMessage = 'Unknown';

  Future<void> _getLocation() async {
    String location;
    try {
      final String result = await platform.invokeMethod('getLocation');
      location = 'Location: $result';
    } on PlatformException catch (e) {
      location = "Failed to get location: '${e.message}'.";
    }

    setState(() {
      _locationMessage = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _getLocation,
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            Text(
              _locationMessage,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}