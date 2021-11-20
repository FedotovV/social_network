import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vk_app/items/text_manipulation.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final String separator;

  PhoneNumberFormatter({this.separator = ' '});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return textManipulation(oldValue, newValue,
        textInputFormatter: FilteringTextInputFormatter.digitsOnly,
        formatPattern: (String filteredString) {
      int offset = 0;
      StringBuffer buffer = StringBuffer();
      for (int i = 0; i <= filteredString.length; i += 1) {
        buffer.write(filteredString.substring(offset, i));
        if (i == filteredString.length) break;
        if (i == 3) {
          // ignore: avoid_print
          print(i);
          buffer.write('-');
        }
        if (i == 7) {
          buffer.write(' ');
        }
        offset = i;
      }
      return buffer.toString();
    });
  }
}
