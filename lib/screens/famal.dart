import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class FaMal extends StatefulWidget {
  const FaMal({Key? key}) : super(key: key);

  @override
  _FaMalState createState() => _FaMalState();
}

class _FaMalState extends State<FaMal> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 28785, 'text': 'MAL D\'ESQUENA'},
    {'text': 'MAL DE PANXA', 'localImage': 'assets/meusPictogrames/malPanxa.png'},
    {'text': 'MAL D\'ORELLA', 'localImage': 'assets/meusPictogrames/malOrella.png'},
    {'id': 28761, 'text': 'MAL DE GOLA'},
    {'id': 28773, 'text': 'MAL DE BRAÇ'},
    {'id': 28753, 'text': 'MAL DE CAP'},
    {'id': 35809, 'text': 'MAL AL PEU'},
    {'id': 37532, 'text': 'MAL A LA MÀ'},
    {'text': 'MAL AL DIT', 'localImage': 'assets/meusPictogrames/malDit.png'},
    {'text': 'MAL AL FER PIPÍ', 'localImage': 'assets/meusPictogrames/malFerPipi.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final fraseModel = context.watch<FraseModel>();
    final frasePictogrames = fraseModel.frase;

    const Color buttonBgColor = Colors.white;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F4E5),
      body: Column(
        children: [
          Frase(
            sentenceWords: frasePictogrames,
            onPopPressed: () => Navigator.pop(context),
            onHomePressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            onDeleteLast: () => context.read<FraseModel>().deleteLast(),
            onClearAll: () => context.read<FraseModel>().clearAll(),
            isFullScreen: _isFullScreen,
            onPlaySentence: () async {
              await TTSService().speak(fraseModel.sentenceText);
            },
            onFullScreenPressed: () async {
              setState(() => _isFullScreen = !_isFullScreen);
              await _fullScreenService.toggleFullScreen(_isFullScreen);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: pictogramesData.length,
                itemBuilder: (context, index) {
                  final catData = pictogramesData[index];

                  final Pictograma currentPictogram = Pictograma(
                    id: catData['id'],
                    text: catData['text']!,
                    localImage: catData['localImage'],
                  );

                  return PictogramButton(
                    pictogram: currentPictogram,
                    buttonColor: buttonBgColor,
                    onTap: () {
                      fraseModel.addWord(currentPictogram);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}