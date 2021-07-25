import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailScreen extends StatelessWidget {
  final Item catalogue;

  const DetailScreen({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
              child: Image.network(catalogue.imgURL),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalogue.name.text.xl4.color(context.accentColor).bold.make(),
                      catalogue.desc.text.xl.make(),
                      10.heightBox,
                      "Stet aliquyam invidunt sit eirmod justo dolores elitr ut no, diam justo labore invidunt dolores et at gubergren, dolor et dolor dolores duo. Eos lorem sea vero stet amet labore tempor sed sadipscing, gubergren sadipscing ea elitr nonumy amet sadipscing stet voluptua dolor, consetetur consetetur diam et lorem diam at."
                      .text.make().p16(),
                    ], 
                  ).py(45),
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalogue.price}".text.bold.xl4.red800.make(),
            AddToCart(catalogue: catalogue).wh(120, 50)
          ],
        ).p32(),
      ),
    );
  }
}