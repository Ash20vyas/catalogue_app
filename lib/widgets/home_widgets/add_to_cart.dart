import 'package:catalogue_app/core/store.dart';
import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddToCart extends StatelessWidget {
  final Item catalogue;

  AddToCart({Key? key,required this.catalogue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutaion, RemoveMutaion]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalogue)? true:false;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){AddMutaion(catalogue);}
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}