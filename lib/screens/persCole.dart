import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';

class PersonesCole extends StatelessWidget {
  PersonesCole({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> pictogramesData = [
    {'text': 'CARLES', 'localImage': 'assets/meusPictogrames/carles.jpg'},
    {'text': 'JUDIT', 'localImage': 'assets/meusPictogrames/judit.jpg'},
    {'text': 'ANNA', 'localImage': 'assets/meusPictogrames/parking.png'},
    {'text': 'NATALIA', 'localImage': 'assets/meusPictogrames/natalia.jpg'},
    {'text': 'JOAN', 'localImage': 'assets/meusPictogrames/joan.jpg'},
    {'text': 'ESTHER', 'localImage': 'assets/meusPictogrames/esther.jpg'},
    {'text': 'MARC', 'localImage': 'assets/meusPictogrames/parking.png'},
  ];

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