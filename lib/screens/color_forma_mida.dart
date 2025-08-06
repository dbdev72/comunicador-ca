import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class ColorFormaMida extends StatefulWidget {
  const ColorFormaMida({Key? key}) : super(key: key);

  @override
  _ColorFormaMidaState createState() => _ColorFormaMidaState();
}

class _ColorFormaMidaState extends State<ColorFormaMida> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 2648, 'text': 'GROC'},
    {'id': 2888, 'text': 'TARONJA'},
    {'id': 2808, 'text': 'VERMELL'},
    {},
    {'id': 4658, 'text': 'GRAN'},
    {'id': 4693, 'text': 'MITJÀ'},
    {'id': 4716, 'text': 'PETIT'},
    {'id': 2807, 'text': 'ROSA'},
    {'id': 4887, 'text': 'VERD'},
    {'id': 4869, 'text': 'BLAU'},
    {},
    {},
    {},
    {},
    {'id': 2923, 'text': 'MARRÓ'},
    {'id': 3340, 'text': 'GRIS'},
    {'id': 2886, 'text': 'NEGRE'},
    {'id': 8043, 'text': 'BLANC'},
    {},
    {'id': 5521, 'text': 'MOLT'},
    {'id': 5546, 'text': 'POC'},
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
                  crossAxisCount: 7,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 18,
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