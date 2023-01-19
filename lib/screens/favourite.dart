import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:favourite_app/screens/selectedItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  //List<int> selected = [];
  @override
  Widget build(BuildContext context) {
    print("Build");
    final provider = Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite App"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => selectedItems())));
                    },
                    icon: Icon(Icons.favorite)))
          ],
        ),
        body: Container(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: ((context, index) {
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.setValue(index);
                          // setState(() {});
                        },
                        title: Text("Item " + index.toString()),
                        trailing: value.selected.contains(index)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border_outlined),
                      );
                    },
                  );
                }))));
  }
}
