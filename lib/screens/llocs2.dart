import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Llocs2 extends StatefulWidget {
  const Llocs2({Key? key}) : super(key: key);

  @override
  State<Llocs2> createState() => _Llocs2State();
}

class _Llocs2State extends State<Llocs2> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> _locations = [
    {'id': 3099, 'text': 'ESTACIÓ DE TREN'},
    {'id': 2472, 'text': 'METRO'},
    {'id': 2260, 'text': 'ASCENSOR'},
    {'text': 'CENTRE COMERCIAL', 'localImage': 'assets/meusPictogrames/centreComercial.png'},
    {'id': 2826, 'text': 'PLATJA'},
    {'id': 4646, 'text': 'FAR'},
    {'id': 16975, 'text': 'TALLER'},
    {'text': 'PARC SAMÀ', 'localImage': 'assets/meusPictogrames/parcSama.png'},
    {'id': 5087, 'text': 'PISTA D\'ESQUÍ'},
    {'id': 8972, 'text': 'TÚNEL'},
    {'text': 'SALOU', 'localImage': 'assets/meusPictogrames/salou.png'},
    {'text': 'PORT AVENTURA', 'localImage': 'assets/meusPictogrames/portAventura.png'},
    {'text': 'VIENA', 'localImage': 'assets/meusPictogrames/viena.png'},
    {'text': 'McDONALD\'S', 'localImage': 'assets/meusPictogrames/mac.png'},
    {'id': 6566, 'text': 'MUSEU'},
    {'id': 3337, 'text': 'GRANJA'},
    {'id': 11319, 'text': 'TEATRE'},
    {},
    {'text': 'PARKING', 'localImage': 'assets/meusPictogrames/parking.png'},
    {'id': 2299, 'text': 'CARRER'},
    {'id': 36291, 'text': 'ESTACIÓ AUTOBÚS'},
  ];

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 6,
    childAspectRatio: .8,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  );

  @override
  Widget build(BuildContext context) {
    final fraseModel = context.watch<FraseModel>();
    final frasePictogrames = fraseModel.frase;

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
                gridDelegate: _gridDelegate,
                itemCount: _locations.length,
                itemBuilder: (context, index) {
                  final location = _locations[index];

                  if (location.isEmpty || location['text'] == null) {
                    return const SizedBox.shrink();
                  }

                  final pictogram = Pictograma(
                    id: location['id'],
                    text: location['text']!,
                    localImage: location['localImage'],
                  );

                  return PictogramButton(
                    pictogram: pictogram,
                    buttonColor: Colors.white,
                    onTap: () => fraseModel.addWord(pictogram),
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