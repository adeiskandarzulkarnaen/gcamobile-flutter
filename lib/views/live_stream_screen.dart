
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:http/http.dart' as http;
import 'package:gcamobile/utils.dart';

class LiveStreamScreen extends StatefulWidget {
  final String cctvName;
  final String linkRtmp;

  const LiveStreamScreen({
    super.key,
    required this.cctvName,
    required this.linkRtmp
  });

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  late Orientation _deviceOrientation;
  String? _videoStreamError; // null if not error

  late VlcPlayerController _videoPlayerController;

  @override
  void initState(){
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      widget.linkRtmp,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    _initializeVideoStatus();
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
    setDeviceAutoOrientation();
  }

  @override
  Widget build(BuildContext context) {
    _deviceOrientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _deviceOrientation == Orientation.landscape
          ? null
          : AppBar(title: Text(widget.cctvName)),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            VlcPlayer(
              controller: _videoPlayerController,
              aspectRatio: 16 / 9,
              placeholder: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ), 
            ),

            if (_videoStreamError != null)
              Text(
                _videoStreamError!,
                style: const TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setDeviceOrientation(MediaQuery.of(context).orientation);
        },
        tooltip: 'Rotate Screen',
        child: const Icon(Icons.sync),
      )
    );
  }

  Future<void> _initializeVideoStatus() async {
    final error = await _getVideoStreamErrorStatus(widget.linkRtmp);
    setState(() {
      _videoStreamError = error;
    });
  }

  Future<String?> _getVideoStreamErrorStatus(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) return null;
      return "MP4 Streaming tidak diaktifkan oleh server";
    } catch (e) {
      return "tidak dapat terhubung ke jaringan";
    }
  }
}