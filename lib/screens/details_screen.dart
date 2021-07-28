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
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            GestureDetector(
              onVerticalDragDown: (_) {
                context.vxNav.pop();
              },
              child: Hero(
                tag: Key(catalogue.id.toString()),
                child: Image.network(catalogue.imgURL),
              ).h32(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalogue.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalogue.desc.text.xl.make(),
                        10.heightBox,
                        "Sea dolor et diam ut dolores dolores eos amet dolore justo. Labore lorem sea sed duo labore duo diam sadipscing et. Takimata at lorem labore dolores ipsum dolores vero, duo gubergren sed eos justo eos. Dolore magna no lorem et, dolor eos magna vero et, ut erat vero sadipscing ipsum.Stet aliquyam invidunt sit eirmod justo dolores elitr ut no, diam justo labore invidunt dolores et at gubergren, dolor et dolor dolores duo. Eos lorem sea vero stet amet labore tempor sed sadipscing, gubergren sadipscing ea elitr nonumy amet sadipscing stet voluptua dolor, consetetur consetetur diam et lorem diam at. Consetetur amet sed est sadipscing est diam sed tempor no sit, dolor dolore stet invidunt ipsum ipsum amet et ipsum."
                            .text
                            .make()
                            .p16(),
                      ],
                    ).py(45),
                  ),
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
            "\$${catalogue.price}"
                .text
                .bold
                .xl4
                .color(context.accentColor)
                .make(),
            AddToCart(catalogue: catalogue).wh(120, 50)
          ],
        ).p32(),
      ),
    );
  }
}
