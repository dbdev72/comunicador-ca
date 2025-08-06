import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Fruita extends StatefulWidget {
  const Fruita({Key? key}) : super(key: key);

  @override
  _FruitaState createState() => _FruitaState();
}

class _FruitaState extends State<Fruita> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 9054, 'text': 'PLÀTAN'},
    {'id': 2462, 'text': 'POMA'},
    {'id': 2561, 'text': 'PERA'},
    {'id': 2400, 'text': 'MADUIXA'},
    {'id': 2557, 'text': 'SÍNDRIA'},
    {'id': 2525, 'text': 'PINYA'},
    {},
    {'id': 2469, 'text': 'MELÓ'},
    {'id': 2483, 'text': 'TARONJA'},
    {'id': 3247, 'text': 'RAÏM'},
    {'id': 11298, 'text': 'MANDARINA'},
    {'id': 8620, 'text': 'MACEDÒNIA'},
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
                  crossAxisCount: 4,
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