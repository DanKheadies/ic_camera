import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ic_camera/providers/providers.dart';
import 'package:ic_camera/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cameras(),
        ),
      ],
      child: const MaterialApp(
        home: CameraScreen(),
      ),
    );
  }
}
