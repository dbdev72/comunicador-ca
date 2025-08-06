import 'package:flutter/material.dart';
import '../services/full_screen/full_screen.dart';
import '../exports.dart';

class Frase extends StatefulWidget {
  final List<Pictograma> sentenceWords;
  final VoidCallback onHomePressed;
  final VoidCallback onPopPressed;
  final VoidCallback onFullScreenPressed;
  final VoidCallback onDeleteLast;
  final VoidCallback onClearAll;
  final VoidCallback onPlaySentence;
  final bool isFullScreen;

  const Frase({
    Key? key,
    required this.sentenceWords,
    required this.onHomePressed,
    required this.onPopPressed,
    required this.onFullScreenPressed,
    required this.onDeleteLast,
    required this.onClearAll,
    required this.onPlaySentence,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  _FraseState createState() => _FraseState();
}

class _FraseState extends State<Frase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints: const BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(bottom: BorderSide(color: Colors.grey[400]!)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/meusPictogrames/home.png'),
            onPressed: widget.onHomePressed,
            iconSize: 48,
          ),
          IconButton(
            icon: Image.asset('assets/meusPictogrames/pop.png'),
            onPressed: widget.onPopPressed,
            iconSize: 48,
          ),
          IconButton(
            icon: Image.asset('assets/meusPictogrames/fullScreen.png'),
            onPressed: widget.onFullScreenPressed,
            iconSize: 48,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.sentenceWords.map((pictograma) {
                  if (pictograma.text == ' ') {
                    return const SizedBox(width: 30);
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: pictograma.localImage != null
                              ? Image.asset(
                                  pictograma.localImage!,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                                )
                              : pictograma.id != null
                                  ? Image.network(
                                      pictograma.imageUrl ?? 'https://placehold.co/60x60/FF0000/FFFFFF?text=NoImg',
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, url, error) => const Icon(Icons.error),
                                    )
                                  : const Icon(Icons.error),
                        ),
                        Text(
                          pictograma.text.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/meusPictogrames/play.png'),
            onPressed: widget.onPlaySentence,
            iconSize: 48,
          ),
          IconButton(
            icon: Image.asset('assets/meusPictogrames/del.png'),
            onPressed: widget.onDeleteLast,
            iconSize: 48,
          ),
          IconButton(
            icon: Image.asset('assets/meusPictogrames/bin.png'),
            onPressed: widget.onClearAll,
            iconSize: 48,
          ),
        ],
      ),
    );
  }
}