import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Teclat extends StatefulWidget {
  const Teclat({Key? key}) : super(key: key);

  @override
  State<Teclat> createState() => _TeclatState();
}

class _TeclatState extends State<Teclat> {
  bool _isFullScreen = false;
  final FullScreenService _fullScreenService = FullScreenService();

  // Buffer per acumular les lletres de la paraula actual
  String _currentWord = "";

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 2627, 'text': '1'},
    {'id': 2628, 'text': '2'},
    {'id': 2629, 'text': '3'},
    {'id': 2630, 'text': '4'},
    {'id': 2631, 'text': '5'},
    {'id': 2632, 'text': '6'},
    {'id': 2633, 'text': '7'},
    {'id': 2634, 'text': '8'},
    {'id': 2635, 'text': '9'},
    {'id': 2626, 'text': '0'},
    {'id': 3418, 'text': '?'},
    {'id': 3417, 'text': '!'},
    {'id': 3146, 'text': 'Q'},
    {'id': 3167, 'text': 'W'},
    {'id': 3096, 'text': 'E'},
    {'id': 3147, 'text': 'R'},
    {'id': 3158, 'text': 'T'},
    {'id': 3171, 'text': 'Y'},
    {'id': 3164, 'text': 'U'},
    {'id': 3117, 'text': 'I'},
    {'id': 3136, 'text': 'O'},
    {'id': 3137, 'text': 'P'},
    {'id': 3415, 'text': '¿'},
    {'id': 3414, 'text': '¡'},
    {'id': 3049, 'text': 'A'},
    {'id': 3152, 'text': 'S'},
    {'id': 3088, 'text': 'D'},
    {'id': 3101, 'text': 'F'},
    {'id': 3104, 'text': 'G'},
    {'id': 3112, 'text': 'H'},
    {'id': 3119, 'text': 'J'},
    {'id': 3120, 'text': 'K'},
    {'id': 3121, 'text': 'L'},
    {'id': 29078, 'text': 'Ç'},
    {'id': 5095, 'text': '#'},
    {'id': 3200, 'text': '-'},
    {},
    {'id': 3173, 'text': 'Z'},
    {'id': 3168, 'text': 'X'},
    {'id': 3069, 'text': 'C'},
    {'id': 3165, 'text': 'V'},
    {'id': 3061, 'text': 'B'},
    {'id': 3133, 'text': 'N'},
    {'id': 3125, 'text': 'M'},
    {'id': 5085, 'text': 'Ñ'},
    {'id': 3189, 'text': ','},
    {'id': 3218, 'text': '.'},
    {'id': 3177, 'text': '@'},
  ];

  @override
  Widget build(BuildContext context) {
    final fraseModel = context.watch<FraseModel>();
    final frasePictogrames = fraseModel.frase;

    const Color buttonBgColor = Colors.white;

    return Scaffold(
      body: Column(
        children: [
          // Usem el nou widget personalitzat de frase textual que mostra el text ampliat i sense pictogrames
          FraseTextual(
            fraseConfirmada: fraseModel.sentenceText,
            paraulaEnCurs: _currentWord,
            onPopPressed: () => Navigator.pop(context),
            onHomePressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            onDeleteLast: () {
              if (_currentWord.isNotEmpty) {
                setState(() {
                  _currentWord = _currentWord.substring(0, _currentWord.length - 1);
                });
              } else {
                context.read<FraseModel>().deleteLast();
              }
            },
            onClearAll: () {
              setState(() => _currentWord = "");
              context.read<FraseModel>().clearAll();
            },
            isFullScreen: _isFullScreen,
            onPlaySentence: () async {
              await TTSService().speak(fraseModel.sentenceText + " " + _currentWord);
            },
            onFullScreenPressed: () async {
              setState(() => _isFullScreen = !_isFullScreen);
              await _fullScreenService.toggleFullScreen(_isFullScreen);
            },
          ),

          // Grid de tecles amb pictogrames
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 12,
                  childAspectRatio: .8,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 7,
                ),
                itemCount: pictogramesData.length,
                itemBuilder: (context, index) {
                  final catData = pictogramesData[index];
                  if (catData.isEmpty) {
                    return const CeldaBuida();
                  }

                  final Pictograma currentPictogram = Pictograma(
                    id: catData['id'],
                    text: catData['text']!,
                  );

                  return PictogramButton(
                    pictogram: currentPictogram,
                    buttonColor: buttonBgColor,
                    showText: false,
                    onTap: () {
                      setState(() {
                        _currentWord += currentPictogram.text;
                      });
                    },
                  );
                },
              ),
            ),
          ),

          // Barra inferior amb botons: copiar, espai, borrar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: SizedBox(
              height: 110,
              child: Row(
                children: [
                  // Botó copiar frase
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: fraseModel.sentenceText + " " + _currentWord,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Frase copiada!')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'assets/meusPictogrames/copy.png',
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),

                  // Botó espai: valida paraula completa
                  Expanded(
                    flex: 10,
                    child: GestureDetector(
                      onTap: () {
                        SystemSound.play(SystemSoundType.click);
                        if (_currentWord.isNotEmpty) {
                          fraseModel.addWord(Pictograma(text: _currentWord));
                          setState(() {
                            _currentWord = "";
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Botó esborrar: elimina lletra o paraula
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        if (_currentWord.isNotEmpty) {
                          setState(() {
                            _currentWord = _currentWord.substring(0, _currentWord.length - 1);
                          });
                        } else {
                          fraseModel.deleteLast();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'assets/meusPictogrames/undo.png',
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
