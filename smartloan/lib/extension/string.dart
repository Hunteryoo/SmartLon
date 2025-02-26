import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

bool isEmptyText(String? str) {
  return str == null || str.isEmpty;
}

extension StringExtension on String {
  // Size calculateSize(double fontSize,
  //     {double minWidth = 0.0, double maxWidth = double.infinity}) {
  //   final TextSpan span =
  //       TextSpan(text: this, style: TextStyle(fontSize: fontSize));
  //   final TextPainter textPainter = TextPainter(
  //       text: span,
  //       textAlign: TextAlign.left,
  //       textDirection: TextDirection.LTR);
  //   textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);
  //   return textPainter.size;
  // }

  ///每n位加一个分隔符
  TextEditingValue addSeparator(int gap, {String separator = " "}) {
    if (isEmpty) {
      return TextEditingValue(text: this);
    }
    ///移除了分隔符
    var removeSeparator = replaceAll(separator, "");
    var list = removeSeparator.split("");
    int separatorCount = 0;
    for (var i = 0; i < removeSeparator.length; i = i + gap) {
      if (i == 0) continue;
      if(i+separatorCount > 8) break;
      list.insert(i + separatorCount, separator);
      separatorCount++;
    }
    var endText = list.join("");
    return TextEditingValue(
      text: endText,
      selection: TextSelection(
        baseOffset: endText.length,
        extentOffset: endText.length,
        affinity: TextAffinity.upstream,
      ),
    );
  }


}
