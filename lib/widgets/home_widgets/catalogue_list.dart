import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 0),
            shrinkWrap: true,
            itemCount: CatalogueModel.items!.length,
            itemBuilder: (context, index) {
              final Item catalogue = CatalogueModel.items![index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                      path: MyRoutes.detailRoute,
                      queryParameters: {"id": catalogue.id.toString()}),
                  params: catalogue,
                ),
                child: CatalogueItem(catalogue: catalogue),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogueModel.items!.length,
            itemBuilder: (context, index) {
              final Item catalogue = CatalogueModel.items![index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                      path: MyRoutes.detailRoute,
                      queryParameters: {"id": catalogue.id.toString()}),
                  params: catalogue,
                ),
                child: CatalogueItem(catalogue: catalogue),
              );
              // return InkWell(
              //   onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DetailScreen(
              //         catalogue: catalogue,
              //       )
              //     )
              //   ),
              //   child: CatalogueItem(catalogue: catalogue),
              // );
            },
          );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;
  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalogue.id.toString()),
        child: CatalogueImage(
          image: catalogue.imgURL,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogue.name.text.lg.color(context.accentColor).bold.make(),
            catalogue.desc.text.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogue.price}".text.bold.xl.make(),
                AddToCart(catalogue: catalogue),
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 8),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    )
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py(context.isMobile ? 16 : 3);
  }
}
