import 'package:encendedor/provider/provider.dart';
import 'package:encendedor/screens/piso_screen.dart';
import 'package:encendedor/screens/screens.dart';
import 'package:encendedor/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ValoresService() ),
        ChangeNotifierProvider(create: ( _ ) => UIPisoProvider()),
      ],

      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomeScreen(),
        'piso': ( _ ) => const PisoScreen(),
      },
    );
  }
}