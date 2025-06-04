import '../models/item.dart';

class ItemService {
  static final ItemService _instance = ItemService._internal();

  factory ItemService() => _instance;

  ItemService._internal();

  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) => _items.add(item);
  void deleteItem(int index) => _items.removeAt(index);
  void updateItem(int index, Item item) => _items[index] = item;
}
