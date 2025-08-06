import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Sentiments extends StatefulWidget {
  const Sentiments({Key? key}) : super(key: key);

  @override
  State<Sentiments> createState() => _SentimentsState();
}

class _SentimentsState extends State<Sentiments> {
  bool _isFullScreen = false;
  final FullScreenService _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 3245, 'text': 'CONTENT'},
    {'id': 2606, 'text': 'TRIST'},
    {'id': 2374, 'text': 'ENFADAT'},
    {'id': 2314, 'text': 'CANSAT'},
    {'id': 11312, 'text': 'NERVIÓS'},
    {'id': 35561, 'text': 'CALOR'},
    {'id': 22205, 'text': 'FRED', 'localImage': 'assets/meusPictogrames/fred.png'},
    {'id': 4626, 'text': 'POR', 'localImage': 'assets/meusPictogrames/por.png'},
    {
      'localImage': 'assets/meusPictogrames/emFaMal.png',
      'text': 'EM FA MAL',
      'navega': FaMal(),
    },
    {'id': 28742, 'text': 'MALALT'},
  ];

  @override
  Widget build(BuildContext context) {
    final fraseModel = context.watch<FraseModel>();
    final frasePictogrames = fraseModel.frase;

    const Color buttonBgColor = Colors.white;

    return Scaffold(
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

                  if (catData.containsKey('navega')) {
                    return PictogramButton(
                      pictogram: currentPictogram,
                      buttonColor: buttonBgColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => catData['navega']),
                        );
                      },
                    );
                  }

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