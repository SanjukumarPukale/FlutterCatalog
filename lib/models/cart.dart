
import 'package:flutter_catalog/models/catalog.dart';

class CatalogModel{

  // Catalog field
  CatalogModel? _catalog;

  // Collection of ids   store ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel? get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel? newCatalog){
    _catalog = newCatalog;
  }

  // get items in the cart
  // List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  // num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // add item
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

    // remove item
  void remove(Item item){ 
    _itemIds.remove(item.id);
  }

}