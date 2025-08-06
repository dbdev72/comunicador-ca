import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Nadal extends StatefulWidget {
  const Nadal({Key? key}) : super(key: key);

  @override
  State<Nadal> createState() => _NadalState();
}

class _NadalState extends State<Nadal> {
  bool _isFullScreen = false;
  final FullScreenService _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 3058, 'text': 'ARBRE DE NADAL'},
    {'text': 'GUARNIR L\'ARBRE', 'localImage': 'assets/meusPictogrames/guarnirArbre.png'},
    {'id': 12303, 'text': 'TIÓ'},
    {'id': 3111, 'text': 'GARLANDA'},
    {'id': 3139, 'text': 'PARE NOEL'},
    {'id': 3067, 'text': 'BOLES DE NADAL'},
    {'id': 5083, 'text': 'LLUMS DE NADAL'},
    {'id': 3100, 'text': 'ESTRELLA DE NADAL'},
    {'id': 5089, 'text': 'PESSEBRE'},
    {},
    {'id': 8261, 'text': 'CAP D\'ANY'},
    {'id': 2688, 'text': 'CARTA'},
    {'id': 3124, 'text': 'REIS MAGS'},
    {'id': 26708, 'text': 'CAVALCADA'},
    {'id': 5565, 'text': 'TORTELL DE REIS'},
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

                  if (catData.isEmpty || catData['text'] == null) {
                    return const SizedBox.shrink();
                  }

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