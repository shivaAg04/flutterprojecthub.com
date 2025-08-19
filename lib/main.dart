import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'view/home_screen.dart';
import 'viewModel/home_screen_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewmodel(),
      child: LayoutBuilder(
        builder: (context, constrain) {
          double maxWidth = kIsWeb ? 420 : constrain.maxWidth;
          return Center(
            child: SizedBox(
              width: maxWidth,
              child: MaterialApp(
                title: 'flutterprojecthub.com',
                home: HomeScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
