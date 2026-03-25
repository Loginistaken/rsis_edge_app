import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _selectedRole;
  bool _agreedLegal = false;
  bool _agreedGPS = false;
  bool _agreedBluetooth = false;
  String? _pseudoUserToken;

  final List<String> _roles = ['Cyclist', 'Pedestrian', 'Vehicle', 'Passenger'];

  @override
  void initState() {
    super.initState();
    _generatePseudoUserToken();
  }

  void _generatePseudoUserToken() {
    var uuid = Uuid();
    String token = uuid.v4();
    setState(() {
      _pseudoUserToken = token;
    });
  }

  Future<void> _proceedNext() async {
    if (_selectedRole != null && _agreedLegal && _agreedGPS && _agreedBluetooth) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('pseudo_user_token', _pseudoUserToken!);
      await prefs.setString('user_role', _selectedRole!);

      // Navigate to the next setup page (Bluetooth + GPS activation)
      Navigator.pushNamed(context, '/setup_gps_ble', arguments: {
        'role': _selectedRole,
        'pseudoUserToken': _pseudoUserToken,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please complete all agreements and select a role.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RSIS Version 6.0 - Node Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to RSIS Version 6.0',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Select your role:',
              style: TextStyle(fontSize: 18),
            ),
            ..._roles.map((role) => RadioListTile(
                  title: Text(role),
                  value: role,
                  groupValue: _selectedRole,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                )),
            Divider(),
            CheckboxListTile(
              title: Text(
                  'I have read and agree to the legal terms and understand this system is for my safety only. Use at your own risk.'),
              value: _agreedLegal,
              onChanged: (bool? value) {
                setState(() {
                  _agreedLegal = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('I consent to GPS usage for local node detection.'),
              value: _agreedGPS,
              onChanged: (bool? value) {
                setState(() {
                  _agreedGPS = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                  'I consent to Bluetooth usage to connect anonymously with nearby nodes via ephemeral tokens.'),
              value: _agreedBluetooth,
              onChanged: (bool? value) {
                setState(() {
                  _agreedBluetooth = value!;
                });
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _proceedNext,
                child: Text('Continue to Node Setup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
