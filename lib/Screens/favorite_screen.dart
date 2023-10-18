import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Screens/my_favorites.dart';

import '../Provider/favorite_item_provider.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({Key? key}) : super(key: key);

  @override
  State<FavoriteApp> createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFavoriteItemScreen()));
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text("Item$index"),
                      trailing: value.selectedItems.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
