import 'package:flutter/material.dart';

import '../models/item.dart';
import '../services/item_service.dart';

class ItemProvider extends ChangeNotifier {
  final ItemService _service = ItemService();

  List<Item> get items => _service.items;

  void addItem(Item item) {
    _service.addItem(item);
    notifyListeners();
  }

  void updateItem(int index, Item item) {
    _service.updateItem(index, item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _service.deleteItem(index);
    notifyListeners();
  }
}
