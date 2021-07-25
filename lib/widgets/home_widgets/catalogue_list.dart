import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/screens/details_screen.dart';
import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items!.length,
      itemBuilder: (context, index){
        final Item catalogue = CatalogueModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                catalogue: catalogue,
              )
            )
          ),
          child: CatalogueItem(catalogue: catalogue),
        );
      },
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;
  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalogue.id.toString()),
            child: CatalogueImage(
              image: catalogue.imgURL,
            ),
          ),
          Expanded(child: Column(
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
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                    child: "Add to Cart".text.make(),
                    )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}