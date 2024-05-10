
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
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
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      widget.linkRtmp,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions()
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceOrientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _deviceOrientation == Orientation.landscape
          ? null
          : AppBar( title: Text(widget.cctvName)),
      body: Center(
        child: VlcPlayer(
          controller: _videoPlayerController,
          aspectRatio: 16 / 9,
          placeholder: const Center(
            child: CircularProgressIndicator(),
          ), 
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
}
