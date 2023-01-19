import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class selectedItems extends StatefulWidget {
  const selectedItems({super.key});

  @override
  State<selectedItems> createState() => _selectedItemsState();
}

class _selectedItemsState extends State<selectedItems> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("My Favourite"),
        ),
        body: Consumer<FavouriteProvider>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: provider.selected.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  onTap: () {
                    value.setValue(value.selected[index]);
                    // setState(() {});
                  },
                  title: Text("Item " + value.selected[index].toString()),
                  trailing: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                );
              }));
        }));
  }
}
