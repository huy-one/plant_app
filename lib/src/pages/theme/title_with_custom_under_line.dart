import 'package:flutter/material.dart';

import 'constrarts.dart';
class TitleWithUnderLine extends StatelessWidget {
  final String text;
  const TitleWithUnderLine({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding/4),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 5,
              color: primaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
