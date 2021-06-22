import 'package:flutter/material.dart';

import 'constrarts.dart';

Widget getIconButton(Icon icon) {
  return Padding(
    padding: const EdgeInsets.only(top: defaultPadding * 3),
    child: Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 24,
            color: primaryColor.withOpacity(0.22),
          ),
          BoxShadow(
              offset: Offset(-15, -15), blurRadius: 20, color: Colors.white)
        ],
      ),
      child: icon,
    ),
  );
}