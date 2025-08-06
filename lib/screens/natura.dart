import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Natura extends StatefulWidget {
  const Natura({Key? key}) : super(key: key);

  @override
  State<Natura> createState() => _NaturaState();
}

class _NaturaState extends State<Natura> {
  bool _isFullScreen = false;
  final FullScreenService _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> pictogramesData = [
    {'id': 3127, 'text': 'FLOR'},
    {'id': 3151, 'text': 'ROSA'},
    {'text': 'RETAMA', 'localImage': 'assets/meusPictogrames/retama.png'},
    {},
    {'id': 2403, 'text': 'GALLINA'},
    {'id': 25293, 'text': 'COLOM'},
    {'id': 2490, 'text': 'OCELL'},
    {'id': 13348, 'text': 'PAÓ'},
    {'id': 3057, 'text': 'ARBRE'},
    {'id': 5077, 'text': 'FULLA'},
    {},
    {},
    {'id': 2517, 'text': 'GOS'},
    {'id': 7114, 'text': 'GAT'},
    {'id': 9200, 'text': 'CAVALL'},
    {'id': 3263, 'text': 'CÉRVOL'},
    {'id': 3143, 'text': 'PLANTA'},
    {'id': 36611, 'text': 'COMPOSTADOR'},
    {},
    {},
    {'id': 8061, 'text': 'CARAGOL'},
    {'id': 26503, 'text': 'TORTUGA'},
    {'id': 2520, 'text': 'PEIX'},
    {'id': 27501, 'text': 'LLEÓ MARÍ'},
    {'id': 28585, 'text': 'PEDRES'},
    {'id': 3160, 'text': 'TERRA'},
    {},
    {},
    {},
    {},
    {'id': 7134, 'text': 'INSECTE'},
    {'id': 5572, 'text': 'DRAC'},
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
                  crossAxisCount: 8,
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