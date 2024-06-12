import 'package:flutter/material.dart';
import 'package:appfavorites/provider/app_state.dart';
import 'package:appfavorites/screens/favorite_screen.dart';
import 'package:appfavorites/screens/random_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    List<Widget> screens = [
      RandomScreen(pair: pair, appState: appState, icon: icon),
      const FavoriteScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 183, 62),
        title: Text(
          "Agil Firli Gunawan (2200016111)",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 28, 183, 62),
              ),
              child: Text(
                'Agil Firli Gunawan (2200016111)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
              selected: currentIndex == 0,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Like'),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
              selected: currentIndex == 1,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
