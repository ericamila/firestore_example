import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_app/pages/error_page.dart';
import 'package:firebase_storage_app/pages/splash_page.dart';
import 'package:firebase_storage_app/pages/storage_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform, A Q U I
  );
  MyApp({super.key});

  final Future<FirebaseApp> _inacializacao = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireBase Storage',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _inacializacao,
        builder: (context, app) {
          if (app.connectionState == ConnectionState.done) {
            return const StoragePage();
          }
          if (app.hasError) return const ErrorPage();
          return const SplashPage();
        },
      ),
    );
  }
}
