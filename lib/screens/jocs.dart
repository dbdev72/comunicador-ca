import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Jocs extends StatefulWidget {
  const Jocs({Key? key}) : super(key: key);

  @override
  State<Jocs> createState() => _JocsState();
}

class _JocsState extends State<Jocs> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  static const _games = [
    {},
    {},
    {},
    {'id': 8119, 'text': 'EXPERIMENT'},
    {'text': 'THOMAS', 'localImage': 'assets/meusPictogrames/thomas.png'},
    {'text': 'LITTLE EINSTEIN', 'localImage': 'assets/meusPictogrames/lilEinstein.png'},
    {'id': 6981, 'text': 'COTXE'},
    {'id': 2263, 'text': 'AUTOBÚS'},
    {'id': 2603, 'text': 'TREN'},
    {'text': 'CLICK', 'localImage': 'assets/meusPictogrames/click.png'},
    {'id': 14544, 'text': 'CUBS'},
    {'id': 8508, 'text': 'LEGO'},
    {'id': 2277, 'text': 'BICICLETA'},
    {'id': 6956, 'text': 'CAMIÓ'},
    {'text': 'TRINEO', 'localImage': 'assets/meusPictogrames/trineo.png'},
    {'text': 'BOSSA DE PA', 'localImage': 'assets/meusPictogrames/bossaPa.png'},
    {'text': 'ENGRANATGE', 'localImage': 'assets/meusPictogrames/engranatge.png'},
    {'text': 'PUZZLE', 'localImage': 'assets/meusPictogrames/puzzle.png'},
  ];

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 6,
    childAspectRatio: 1,
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
                itemCount: _games.length,
                itemBuilder: (context, index) {
                  final game = _games[index];

                  if (game.isEmpty || game['text'] == null) {
                    return const SizedBox.shrink();
                  }

                  final pictogram = Pictograma(
                    id: game['id'],
                    text: game['text']!,
                    localImage: game['localImage'],
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