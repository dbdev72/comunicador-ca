import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isCatalanAvailable = false;

  Future<List<dynamic>> _loadVoicesWithRetry() async {
    List<dynamic> voices = [];
    int tries = 0;

    while (voices.isEmpty && tries < 3) {
      if (tries > 0) {
        await Future.delayed(Duration(milliseconds: 500 * tries));
      }
      voices = await _flutterTts.getVoices;
      tries++;
    }
    return voices;
  }

  Future<void> initTTS() async {
  List<dynamic> veus = [];

  if (kIsWeb) {
    veus = await _loadVoicesWithRetry();
  } else {
    veus = await _flutterTts.getVoices;
  }

  print("Veus disponibles:");
  veus.forEach((v) => print(v));

  final veuCatalana = veus.firstWhere(
    (veu) {
      final nom = (veu['name'] ?? '').toString().toLowerCase();
      final localitzacio = (veu['locale'] ?? veu['lang'] ?? '').toString().toLowerCase();
      return localitzacio == 'ca-es';
    },
    orElse: () => null,
  );

  if (veuCatalana != null) {
    print("Veu catalana trobada: ${veuCatalana['name']}");
    await _flutterTts.setVoice({
      'name': veuCatalana['name'],
      'locale': veuCatalana['locale'] ?? veuCatalana['lang'],
    });
    await _flutterTts.setLanguage("ca-ES");
  }
  else {
    final veuEspanola = veus.firstWhere(
      (veu) {
        final nom = (veu['name'] ?? '').toString().toLowerCase();
        final localitzacio = (veu['locale'] ?? veu['lang'] ?? '').toString().toLowerCase();
        return localitzacio == 'es-es' && nom.contains('google');
      },
      orElse: () => null,
    );

    if (veuEspanola != null) {
      print("No hi ha veu catalana, utilitzant veu espanyola de Google: ${veuEspanola['name']}");
      await _flutterTts.setVoice({
        'name': veuEspanola['name'],
        'locale': veuEspanola['locale'] ?? veuEspanola['lang'],
      });
      await _flutterTts.setLanguage("es-ES");
    } else {
      print("No s'ha trobat veu catalana ni espanyola, s'utilitzarà la veu per defecte.");
    }
  }

  await _flutterTts.setSpeechRate(0.6);
  await _flutterTts.setVolume(1.0);
  await _flutterTts.setPitch(1.0);
}


  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  bool get isCatalanAvailable => _isCatalanAvailable;
}