import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipboardUtils {
  static void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Copied to your clipboard!'),
        ),
      );
    },);
  }
}