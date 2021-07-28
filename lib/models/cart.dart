import 'package:catalogue_app/core/store.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalogue field
  late CatalogueModel _catalogue;

  //store IDs of each Item
  final List<int> _itemId = [];

  // ignore: unnecessary_getters_setters
  CatalogueModel get catalogue => _catalogue;

  // ignore: unnecessary_getters_setters
  set catalogue(CatalogueModel newCatalogue) {
    _catalogue = newCatalogue;
  }

  //Get Item in Cart
  List<Item> get items => _itemId.map((id) => _catalogue.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutaion extends VxMutation<MyStore> {
  final Item item;

  AddMutaion(this.item);
  @override
  perform() {
    store!.cart._itemId.add(item.id);
  }
}

class RemoveMutaion extends VxMutation<MyStore> {
  final Item item;

  RemoveMutaion(this.item);
  @override
  perform() {
    store!.cart._itemId.remove(item.id);
  }
}
