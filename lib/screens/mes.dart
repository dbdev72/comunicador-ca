import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../exports.dart';
import '../models/pictograma.dart';
import '../widgets/pictogram_button.dart';
import '../services/full_screen/full_screen.dart';

class Mes extends StatefulWidget {
  const Mes({Key? key}) : super(key: key);

  @override
  State<Mes> createState() => _MesState();
}

class _MesState extends State<Mes> {
  bool _isFullScreen = false;
  final _fullScreenService = FullScreenService();

  final List<Map<String, dynamic>> _months = [
    {'id': 6488, 'text': 'GENER'},
    {'id': 6498, 'text': 'FEBRER'},
    {'id': 6558, 'text': 'MARÇ'},
    {'id': 6024, 'text': 'ABRIL'},
    {'id': 6559, 'text': 'MAIG'},
    {'id': 6539, 'text': 'JUNY'},
    {'id': 6538, 'text': 'JULIOL'},
    {'id': 6034, 'text': 'AGOST'},
    {'id': 6613, 'text': 'SETEMBRE'},
    {'id': 6571, 'text': 'OCTUBRE'},
    {'id': 6570, 'text': 'NOVEMBRE'},
    {'id': 6476, 'text': 'DESEMBRE'},
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
                itemCount: _months.length,
                itemBuilder: (context, index) {
                  final month = _months[index];

                  final pictogram = Pictograma(
                    id: month['id'],
                    text: month['text']!,
                    localImage: month['localImage'],
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