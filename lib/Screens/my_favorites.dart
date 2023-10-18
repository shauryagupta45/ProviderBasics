import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/favorite_item_provider.dart';

class MyFavoriteItemScreen extends StatefulWidget {
  const MyFavoriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoriteItemScreen> createState() => _MyFavoriteItemScreenState();
}

class _MyFavoriteItemScreenState extends State<MyFavoriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    // final favProvider =
    //     Provider.of<FavoriteItemProvider>(context, listen: false);
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
                    if (value.selectedItems.contains(index)) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.removeItem(index);
                          }
                        },
                        title: Text("Item$index"),
                        trailing: value.selectedItems.contains(index)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                      );
                    } else {
                      return Container();
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}
