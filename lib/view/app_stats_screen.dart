import 'package:flutter/material.dart';

import '../core/app_color.dart';

class AppStatsScreen extends StatelessWidget {
  const AppStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.appBarBgColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        title: Text('Future Features'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithPadding(
              text: "1. Total number of apps listed on the platform"),
          TextWithPadding(text: "2. Event listings by location"),
          TextWithPadding(text: "3. Job openings section"),
          TextWithPadding(text: "4. Curated articles section"),
          TextWithPadding(text: "5. Apps categorized by industry"),
          TextWithPadding(text: "6. Flutter Package hub"),
        ],
      ),
    );
  }
}

class TextWithPadding extends StatelessWidget {
  final String text;
  const TextWithPadding({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
