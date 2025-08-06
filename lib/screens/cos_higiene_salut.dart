import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class CosHigieneSalut extends StatefulWidget {
  const CosHigieneSalut({Key? key}) : super(key: key);

  @override
  _CosHigieneSalutState createState() => _CosHigieneSalutState();
}

class _CosHigieneSalutState extends State<CosHigieneSalut> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 2737, 'text': 'DENTS'},
    {},
    {'id': 25171, 'text': 'SABÓ'},
    {'id': 2560, 'text': 'SECADOR'},
    {},
    {
      'localImage': 'assets/meusPictogrames/emFaMal.png',
      'text': 'EM FA MAL',
      'navega': FaMal(),
    },
    {'id': 2673, 'text': 'CAP'},
    {'id': 2748, 'text': 'ESQUENA'},
    {'id': 2735, 'text': 'DESODORANT'},
    {'id': 2862, 'text': 'PAPER WC'},
    {},
    {'id': 8163, 'text': 'MEDICAMENT'},
    {'id': 2786, 'text': 'PANXA'},
    {'id': 25327, 'text': 'PEU'},
    {'id': 2858, 'text': 'PASTA DE DENTS'},
    {'id': 2852, 'text': 'PINTA'},
    {'id': 36793, 'text': 'MASCARETA'},
    {'id': 36761, 'text': 'GEL'},
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