import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';

class ActivitatsFestes extends StatelessWidget {
  ActivitatsFestes({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 11251, 'text': 'ENCÀRREC'},
    {'id': 4670, 'text': 'EXCURSIÓ'},
    {'id': 4671, 'text': 'VIATGE'},
    {'id': 25974, 'text': 'COLÒNIES'},
    {'id': 15036, 'text': 'SANT JOAN', 'navega': StJoan()},
    {'id': 26786, 'text': 'ANIVERSARI'},
    {'id': 3149, 'text': 'REGAL'},
    {'id': 7099, 'text': 'FESTA'},
    {'id': 5478, 'text': 'GEGANTS'},
    {'id': 3074, 'text': 'CARNAVAL'},
    {'id': 12307, 'text': 'PASQUA'},
    {'text': 'SANT JORDI', 'localImage': 'assets/meusPictogrames/stjordi.png'},
    {'id': 8302, 'text': 'CASTANYADA'},
    {'id': 6951, 'text': 'HALLOWEEN'},
    {'id': 3092, 'text': 'NADAL', 'navega': Nadal()},
  ];

  Widget build(BuildContext context) {
    final fraseModel = context.watch<FraseModel>();
    final frasePictogrames = fraseModel.frase;

    return Scaffold(
      body: Column(
        children: [
          Frase(
            sentenceWords: frasePictogrames,
            onPopPressed: () => Navigator.pop(context),
            onHomePressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            onDeleteLast: () => context.read<FraseModel>().deleteLast(),
            onClearAll: () => context.read<FraseModel>().clearAll(),
            onPlaySentence: () async {
              await TTSService().speak(fraseModel.sentenceText);
            },
            onFullScreenPressed: () async {
              await FullScreenService().enableFullScreen();
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
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => catData['navega']),
                        );
                      },
                    );
                  }

                  return PictogramButton(
                    pictogram: currentPictogram,
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