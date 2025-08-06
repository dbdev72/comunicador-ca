import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class AparellsMobles extends StatefulWidget {
  const AparellsMobles({Key? key}) : super(key: key);

  @override
  _AparellsMoblesState createState() => _AparellsMoblesState();
}

class _AparellsMoblesState extends State<AparellsMobles> {
  bool _isFullScreen = false;
  final FullScreenService _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 2611, 'text': 'FINESTRA'},
    {'id': 2518, 'text': 'PERSIANA'},
    {'id': 2357, 'text': 'CORTINES'},
    {'id': 37438, 'text': 'ALTAVEU'},
    {'id': 38255, 'text': 'CABLE'},
    {'id': 28099, 'text': 'IPAD'},
    {'id': 11376, 'text': 'CADIRA'},
    {'id': 11302, 'text': 'TAULA'},
    {'id': 2304, 'text': 'LLIT'},
    {},
    {'id': 31819, 'text': 'CARREGADOR'},
    {'id': 7190, 'text': 'ORDINADOR'},
    {'id': 3244, 'text': 'PORTA'},
    {'id': 2571, 'text': 'SOFÀ'},
    {'id': 24169, 'text': 'MECEDORA'},
    {'id': 6212, 'text': 'CADIRA DE RODES'},
    {'id': 6228, 'text': 'ESTENEDOR'},
    {'id': 8202, 'text': 'PROJECTOR'},
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
              setState(() {
                _isFullScreen = !_isFullScreen;
              });
              await _fullScreenService.toggleFullScreen(_isFullScreen);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
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