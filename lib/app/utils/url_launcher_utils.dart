import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherUtils {
  static Future<void> launchUrls(BuildContext context, Uri url) async {
    final canLaunch = await canLaunchUrl(url);
    if (!context.mounted) return;
    if (canLaunch) {
      await launchUrl(url);
    } else {
      showSnackBar(context, 'Could not launch URL');
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }
}
