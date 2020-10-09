import 'package:flutter/material.dart';
import 'package:pogo91/utils/colors.dart';

class EdtDecoration {
  BoxDecoration getDecoration() {
    return BoxDecoration(
        border: Border.all(
          color: edtBorderColor,
        ),
        borderRadius: BorderRadius.circular(5),
        color: edtBgGreyColor);
  }
}
