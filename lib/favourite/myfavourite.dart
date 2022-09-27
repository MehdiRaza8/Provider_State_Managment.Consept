import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    final favouriteItemProvidr = Provider.of<FavouriteItem>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavouriteItem()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteItemProvidr.selectedItem.length,
                itemBuilder: ((context, index) {
                  return Consumer<FavouriteItem>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('Item' + index.toString()),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      );
                    },
                  );
                })),
          )
        ],
      ),
    );
  }
}
