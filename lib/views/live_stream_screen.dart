import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:gcamobile/utils.dart';

class LiveStreamScreen extends StatefulWidget {
  final String cctvName;
  final String linkRtmp;

  const LiveStreamScreen({
    super.key,
    required this.cctvName,
    required this.linkRtmp,
  });

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  bool _isLoading = true;
  String? _videoStreamError;
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      widget.linkRtmp,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    _videoPlayerController.addListener(_onVlcPlayerStateChange);
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_onVlcPlayerStateChange);
    _videoPlayerController.stopRendererScanning();
    _videoPlayerController.dispose();
    setDeviceAutoOrientation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
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
            if (_isLoading && _videoStreamError == null) 
              const Center(
                child: CircularProgressIndicator(color: Colors.white,)
              ),
            if (_videoStreamError != null)
              Center(
                child: Text(
                  _videoStreamError!,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setDeviceOrientation(MediaQuery.of(context).orientation);
        },
        tooltip: 'Rotate Screen',
        child: const Icon(Icons.sync),
      ),
    );
  }

  void _onVlcPlayerStateChange() {
    final playingState = _videoPlayerController.value.playingState;
    setState(() {
      if (playingState == PlayingState.buffering) {
        _isLoading = true;
        _videoStreamError = null; // Ensure error is reset when buffering
      } else if (playingState == PlayingState.stopped) {
        _isLoading = true;
        _videoStreamError = "Stream tidak tersedia saat ini.";
      } else if (playingState == PlayingState.error) {
        _isLoading = false;
        _videoStreamError = "Error: video stopped unexpectedly.";
      } else {
        _isLoading = false;
        _videoStreamError = null;
      }
    });
  }
}
