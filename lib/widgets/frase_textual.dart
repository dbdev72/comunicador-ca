import 'package:flutter/material.dart';

class FraseTextual extends StatefulWidget {
  final String fraseConfirmada;
  final String paraulaEnCurs;
  final VoidCallback onHomePressed;
  final VoidCallback onPopPressed;
  final VoidCallback onFullScreenPressed;
  final VoidCallback onDeleteLast;
  final VoidCallback onClearAll;
  final VoidCallback onPlaySentence;
  final bool isFullScreen;

  const FraseTextual({
    Key? key,
    required this.fraseConfirmada,
    required this.paraulaEnCurs,
    required this.onHomePressed,
    required this.onPopPressed,
    required this.onFullScreenPressed,
    required this.onDeleteLast,
    required this.onClearAll,
    required this.onPlaySentence,
    required this.isFullScreen,
  }) : super(key: key);

  _FraseTextualState createState() => _FraseTextualState();
}

class _FraseTextualState extends State<FraseTextual> {

  @override
  Widget build(BuildContext context) {
    final textToShow = (widget.fraseConfirmada + " " + widget.paraulaEnCurs).trim();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints: const BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(bottom: BorderSide(color: Colors.grey!)),
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
              child: Text(
                textToShow.toUpperCase(),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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