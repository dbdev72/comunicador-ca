// lib/services/full_screen/full_screen_mobile_desktop.dart
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
import 'full_screen_interface.dart';

class FullScreenServiceImpl implements FullScreenService {
  static final FullScreenServiceImpl _instance = FullScreenServiceImpl._internal();
  factory FullScreenServiceImpl() => _instance;
  FullScreenServiceImpl._internal();

  @override
  Future<void> toggleFullScreen(bool enable) async {
    try {
      if (enable) {
        await _enableFullScreen();
      } else {
        await _disableFullScreen();
      }
    } catch (e) {
      debugPrint('FullScreen error: $e');
    }
  }

  Future<void> _enableFullScreen() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await DesktopWindow.setFullScreen(true);
    }
  }

  Future<void> _disableFullScreen() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      await DesktopWindow.setFullScreen(false);
    }
  }

  @override
  bool get isFullScreen => false;
}