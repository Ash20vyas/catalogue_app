import 'package:catalogue_app/models/catalogue.dart';

class CartModel{
  
  //catalogue field
  late CatalogueModel _catalogue;

  //store IDs of each Item
  final List<int> _itemId = [];

  CatalogueModel get catalogue => _catalogue;

  set catalogue(CatalogueModel newCatalogue){
    _catalogue = newCatalogue;
  }

  //Get Item in Cart
  List<Item> get items => _itemId.map((id) => _catalogue.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item){
    _itemId.add(item.id);
  }

  //Remove Item
  void remove(Item item){
    _itemId.remove(item.id);
  }
}