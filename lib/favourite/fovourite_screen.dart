import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:managestate/favourite/myfavourite.dart';
import 'package:managestate/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
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
                itemCount: 100,
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
