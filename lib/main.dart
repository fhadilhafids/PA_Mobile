import 'package:flutter/material.dart';
import 'package:pa_mobile/firebase_options.dart';
import 'dart:async';
import 'package:pa_mobile/screens/introduction_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'theme_mode_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ThemeModeData())
      ],
      child: Builder(builder: (context) {
        ColorScheme lightScheme = ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
        );
        ColorScheme darkScheme = ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        );
        return MaterialApp(
            title: 'IKOA FURNITURE',
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorScheme: lightScheme,
              textTheme: const TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Serif'),
                bodyLarge: TextStyle(color: Colors.black87),
                bodyMedium: TextStyle(color: Colors.black54),
                bodySmall: TextStyle(color: Colors.black45),
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorScheme: darkScheme,
              textTheme: const TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Serif'),
                bodyLarge: TextStyle(color: Colors.white70),
                bodyMedium: TextStyle(color: Colors.white60),
                bodySmall: TextStyle(color: Colors.white54),
              ),
            ),
            themeMode: Provider.of<ThemeModeData>(context).themeMode,
            home: const MyHomePage(),
            debugShowCheckedModeBanner: false);
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const IntroductionPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Image.asset("assets/images/logo.png", width: 300, height: 200),
        ),
      ),
    );
  }
}
