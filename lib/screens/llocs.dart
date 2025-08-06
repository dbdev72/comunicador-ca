import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Llocs extends StatefulWidget {
  const Llocs({Key? key}) : super(key: key);

  @override
  State<Llocs> createState() => _LlocsState();
}

class _LlocsState extends State<Llocs> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final _places = [
    {'text': 'CASA', 'localImage': 'assets/meusPictogrames/casa.png'},
    {'text': 'BOTIGA', 'localImage': 'assets/meusPictogrames/botiga.png'},
    {'id': 6454, 'text': 'COL·LEGI'},
    {'text': 'CLASSE', 'localImage': 'assets/meusPictogrames/classe.png'},
    {'id': 2430, 'text': 'LAVABO'},
    {'id': 3142, 'text': 'PISCINA'},
    {'text': 'GARATGE', 'localImage': 'assets/meusPictogrames/garatge.png'},
    {'id': 6896, 'text': 'TRASTER'},
    {'id': 2974, 'text': 'HORT'},
    {},
    {'id': 2704, 'text': 'TARRAGONA'},
    {'text': 'TORTOSA', 'localImage': 'assets/meusPictogrames/tortosa.png'},
    {'id': 6523, 'text': 'AMBULATORI'},
    {'id': 3116, 'text': 'HOSPITAL'},
    {'id': 2849, 'text': 'PERRUQUERIA'},
    {},
    {'id': 11343, 'text': 'PIS'},
    {'id': 5957, 'text': 'XALET'},
    {'text': 'RESTAURANT', 'localImage': 'assets/meusPictogrames/restaurant.png'},
    {'id': 28131, 'text': 'CAFETERIA'},
    {'id': 15728, 'text': 'HOTEL'},
    {},
    {'id': 8254, 'text': 'BALCÓ'},
    {
      'id': 3220,
      'text': '',
      'navega': Llocs2(),
    },
  ];

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 6,
    childAspectRatio: .9,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  );

  @override
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
                itemCount: _places.length,
                itemBuilder: (context, index) {
                  final place = _places[index];

                  if (place.isEmpty || place['text'] == null) {
                    return const SizedBox.shrink();
                  }

                  final pictogram = Pictograma(
                    id: place['id'],
                    text: place['text']!,
                    localImage: place['localImage'],
                  );

                  if (place.containsKey('navega')) {
                    return PictogramButton(
                      pictogram: pictogram,
                      buttonColor: Colors.white,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => place['navega']),
                      ),
                    );
                  }

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