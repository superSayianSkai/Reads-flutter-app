import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  VideoPlayerController? _controller;
  bool _isInitialised = false;

  VideoPlayerController? get controller => _controller;
  bool get isInitialised => _isInitialised;

  Future<void> initialise() async {
    if (_controller == null) {
      _controller = VideoPlayerController.asset("assets/video/video.mp4");
      await _controller!.initialize();
      _isInitialised = true;
      notifyListeners();
    }
  }

  void playAndpause() {
    if (_controller == null) return;
    _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
    notifyListeners();
  }

  void unInitialize() {
    if (_controller != null) {
      _isInitialised = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
