import 'package:flutter/material.dart';
import 'package:appfavorites/provider/app_state.dart';
import 'package:appfavorites/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 255, 34)),
        ),
        title: "Namer App",
        home: const HomeScreen(),
      ),
    );
  }
}
