import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String url;

  const LinkButton({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(Icons.link, color: Colors.white),
      label: Text(text, style: TextStyle(color: Colors.white)),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
    );
  }
}
