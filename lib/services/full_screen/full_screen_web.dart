// lib/services/full_screen/full_screen_web.dart
import 'dart:js_interop';
import 'full_screen_interface.dart';

@JS()
@staticInterop
class DocumentElement {}

extension DocumentElementExtension on DocumentElement {
  external void requestFullscreen();
}

@JS('document.documentElement')
external DocumentElement? get documentElement;

@JS()
@staticInterop
class Document {}

extension DocumentExtension on Document {
  external JSObject? get fullscreenElement;
  external void exitFullscreen();
}

@JS('document')
external Document get documentInstance;

class FullScreenWebService implements FullScreenService {
  static final FullScreenWebService _instance = FullScreenWebService._internal();
  factory FullScreenWebService() => _instance;
  FullScreenWebService._internal();

  @override
  Future<void> toggleFullScreen(bool enable) async {
    try {
      if (enable) {
        await _enableFullScreen();
      } else {
        await _disableFullScreen();
      }
    } catch (e) {
      print('FullScreen web error: $e');
    }
  }

  Future<void> _enableFullScreen() async {
    documentElement?.requestFullscreen();
  }

  Future<void> _disableFullScreen() async {
    if (isFullScreen) {
      documentInstance.exitFullscreen();
    }
  }

  @override
  bool get isFullScreen => documentInstance.fullscreenElement != null;
}