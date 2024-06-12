import 'package:appfavorites/provider/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (BuildContext context, int index) {
        var pair = appState.favorites[index];
        return Dismissible(
          key: Key(pair.asPascalCase), // Key unik untuk setiap item
          onDismissed: (direction) {
            // Hapus item dari daftar favorit saat di-swipe
            context.read<AppState>().removeFromFavorites(pair);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Item removed from favorites'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Batalkan penghapusan jika tombol Undo ditekan
                    context.read<AppState>().addToFavorites(pair);
                  },
                ),
              ),
            );
          },
          background: Container(
            color: Color.fromARGB(255, 89, 244, 54),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
        );
      },
    );
  }
}
