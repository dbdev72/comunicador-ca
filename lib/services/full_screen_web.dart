// lib/services/full_screen_web.dart
import 'dart:js_interop';

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
  external void exitFullscreen();
}

@JS('document')
external Document get documentInstance;

// Ara FullScreenService es defineix aquí per a la web
class FullScreenService {
  static final FullScreenService _instance = FullScreenService._internal();
  factory FullScreenService() => _instance;
  FullScreenService._internal();

  Future<void> enableFullScreen() async {
    // La lògica específica de web per habilitar
    documentElement?.requestFullscreen();
    print('FullScreenService Web: Pantalla completa activada.');
  }

  Future<void> disableFullScreen() async {
    // La lògica específica de web per deshabilitar
    documentInstance.exitFullscreen();
    print('FullScreenService Web: Pantalla completa desactivada.');
  }
}