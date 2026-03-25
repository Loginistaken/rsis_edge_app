import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SetupGpsBleScreen extends StatefulWidget {
  final Map<String, dynamic> args;
  SetupGpsBleScreen({required this.args});

  @override
  _SetupGpsBleScreenState createState() => _SetupGpsBleScreenState();
}

class _SetupGpsBleScreenState extends State<SetupGpsBleScreen> {
  bool _gpsEnabled = false;
  bool _bluetoothEnabled = false;
  String? _pseudoToken;
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription? _scanSubscription;
  StreamSubscription? _locationSubscription;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _pseudoToken = widget.args['pseudoUserToken'] ?? Uuid().v4();
    _checkGpsStatus();
    _checkBluetoothStatus();
  }

  Future<void> _checkGpsStatus() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
    }
    setState(() {
      _gpsEnabled = serviceEnabled;
    });
    if (serviceEnabled) {
      _startLocationUpdates();
    }
  }

  Future<void> _checkBluetoothStatus() async {
    _flutterBlue.state.listen((state) {
      setState(() {
        _bluetoothEnabled = state == BluetoothState.on;
      });
      if (state == BluetoothState.on) {
        _startBleAdvertising();
        _startBleScanning();
      }
    });
  }

  void _startLocationUpdates() {
    _locationSubscription =
        Geolocator.getPositionStream(distanceFilter: 2, intervalDuration: Duration(seconds: 5))
            .listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
      // Send to backend / Crow hazard engine
      // You can add your POST request here
    });
  }

  void _startBleAdvertising() {
    // Simulate ephemeral token rotation every 8–10 seconds
    Timer.periodic(Duration(seconds: 9), (timer) {
      _pseudoToken = Uuid().v4(); // Rotate ephemeral token
      // Broadcast via BLE (pseudo code, implement platform-specific)
      print('Advertising ephemeral token: $_pseudoToken');
    });
  }

  void _startBleScanning() {
    _scanSubscription = _flutterBlue.scan(timeout: Duration(seconds: 4)).listen((scanResult) {
      // Handle nearby RSIS nodes
      print(
          'Found device ${scanResult.device.name} with RSSI ${scanResult.rssi}');
    });
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _locationSubscription?.cancel();
    super.dispose();
  }

  void _proceedToDashboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('gps_enabled', _gpsEnabled);
    await prefs.setBool('bluetooth_enabled', _bluetoothEnabled);
    Navigator.pushNamed(context, '/dashboard', arguments: {
      'role': widget.args['role'],
      'pseudoUserToken': _pseudoToken,
      'position': _currentPosition,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RSIS Version 6.0 - GPS & BLE Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(_gpsEnabled ? Icons.gps_fixed : Icons.gps_off),
              title: Text('GPS / Location Service'),
              subtitle:
                  Text(_gpsEnabled ? 'Enabled' : 'Please enable location'),
            ),
            ListTile(
              leading: Icon(
                  _bluetoothEnabled ? Icons.bluetooth : Icons.bluetooth_disabled),
              title: Text('Bluetooth 5+'),
              subtitle: Text(_bluetoothEnabled
                  ? 'Enabled and scanning'
                  : 'Please enable Bluetooth'),
            ),
            if (_currentPosition != null)
              Text(
                  'Current Position: Lat ${_currentPosition!.latitude}, Lon ${_currentPosition!.longitude}'),
            Spacer(),
            ElevatedButton(
              onPressed: (_gpsEnabled && _bluetoothEnabled)
                  ? _proceedToDashboard
                  : null,
              child: Text('Proceed to RSIS Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
