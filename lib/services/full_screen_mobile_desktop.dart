// lib/services/full_screen_mobile_desktop.dart
import 'package:flutter/services.dart';
import 'package:desktop_window/desktop_window.dart'; // Assegura't que tens aquest paquet afegit al pubspec.yaml

// NO importem platform_stub ni platform_io aquí. Això s'encarrega al full_screen.dart principal.

class FullScreenService {
  static final FullScreenService _instance = FullScreenService._internal();
  factory FullScreenService() => _instance;
  FullScreenService._internal();

  // Implementació per a mòbil (Android/iOS)
  Future<void> enableFullScreen() async {
    await _enableFullScreenMobile();
  }

  Future<void> disableFullScreen() async {
    await _disableFullScreenMobile();
  }

  Future<void> _enableFullScreenMobile() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> _disableFullScreenMobile() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // Implementació per a escriptori (Windows, Linux, MacOS)
  Future<void> _enableFullScreenDesktop() async {
    await DesktopWindow.setFullScreen(true);
  }

  Future<void> _disableFullScreenDesktop() async {
    await DesktopWindow.setFullScreen(false);
  }
}