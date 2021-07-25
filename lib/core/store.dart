import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';


class MyStore extends VxStore{
  CatalogueModel catalogue = CatalogueModel();
  CartModel cart = CartModel();

  MyStore() {
    catalogue = CatalogueModel();
    cart = CartModel();
    cart.catalogue = catalogue;
  }
}