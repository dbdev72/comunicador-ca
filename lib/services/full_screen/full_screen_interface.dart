// lib/services/full_screen/full_screen_interface.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'full_screen_mobile_desktop.dart';
import 'full_screen_web.dart';

abstract class FullScreenService {
  Future<void> toggleFullScreen(bool enable);
  bool get isFullScreen;

  factory FullScreenService() {
    if (kIsWeb) {
      return FullScreenWebService();
    } else {
      return FullScreenServiceImpl();
    }
  }
}