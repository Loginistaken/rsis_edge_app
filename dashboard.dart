import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class RsisDashboardScreen extends StatefulWidget {
  final Map<String, dynamic> args;
  RsisDashboardScreen({required this.args});

  @override
  _RsisDashboardScreenState createState() => _RsisDashboardScreenState();
}

class _RsisDashboardScreenState extends State<RsisDashboardScreen> {
  late IOWebSocketChannel _channel;
  List<Map<String, dynamic>> hazardTiles = [];
  List<Map<String, dynamic>> nodes = [];
  Map<String, dynamic>? userPosition;

  @override
  void initState() {
    super.initState();
    userPosition = widget.args['position'];
    _connectWebSocket();
  }

  void _connectWebSocket() {
    // Replace with your backend WS URL
    _channel = IOWebSocketChannel.connect('wss://yourdomain.com/ws/dashboard');
    _channel.stream.listen((message) {
      Map<String, dynamic> data = json.decode(message);
      setState(() {
        hazardTiles = List<Map<String, dynamic>>.from(data['tiles'] ?? []);
        nodes = List<Map<String, dynamic>>.from(data['nodes'] ?? []);
      });
    }, onError: (error) {
      print('WebSocket error: $error');
    });
  }

  Color _getTileColor(String riskLevel) {
    switch (riskLevel) {
      case 'LOW':
        return Colors.green;
      case 'MEDIUM':
        return Colors.yellow;
      case 'HIGH':
        return Colors.orange;
      case 'CRITICAL':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildHazardTile(Map<String, dynamic> tile) {
    return ListTile(
      leading: Icon(Icons.map, color: _getTileColor(tile['risk'])),
      title: Text('Tile: ${tile['tile_id']}'),
      subtitle: Text('Risk: ${tile['risk']} | Density: ${tile['density']}'),
    );
  }

  Widget _buildNodeInfo(Map<String, dynamic> node) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('Role: ${node['role']}'),
      subtitle: Text('Distance: ${node['distance']} m | Token: ${node['pst_id']}'),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RSIS Version 6.0 Dashboard')),
      body: RefreshIndicator(
        onRefresh: () async {
          // Optional: request backend for manual refresh
          _channel.sink.add(json.encode({'action': 'refresh'}));
        },
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'User Position: Lat ${userPosition?['latitude'] ?? '-'}, Lon ${userPosition?['longitude'] ?? '-'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Hazard Tiles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...hazardTiles.map(_buildHazardTile).toList(),
            SizedBox(height: 16),
            Text('Nearby Nodes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...nodes.map(_buildNodeInfo).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Optional: trigger haptic feedback / alert on CRITICAL tile
          final criticalTiles = hazardTiles.where((t) => t['risk'] == 'CRITICAL');
          if (criticalTiles.isNotEmpty) {
            // Implement mobile vibration here if desired
            print('⚠️ Critical hazards nearby!');
          }
        },
        child: Icon(Icons.warning),
        backgroundColor: Colors.red,
        tooltip: 'Check Critical Hazards',
      ),
    );
  }
}
