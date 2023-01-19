import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> selected = [];
  List<int> get selectedItem => selected;
  void setValue(value) {
    if (selected.contains(value)) {
      selected.remove(value);
    } else {
      selected.add(value);
    }
    notifyListeners();
  }
}
