import 'package:flutter/foundation.dart';

class FavoriteItemProvider with ChangeNotifier {
  final List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addItems(int item) {
    _selectedItems.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    _selectedItems.remove(item);
    notifyListeners();
  }
}
