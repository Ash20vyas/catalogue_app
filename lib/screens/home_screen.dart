import 'dart:convert';

import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/item_widget.dart';
import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_app/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
class HomeScreen extends StatefulWidget 
{
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds : 2));
    final encodeJson = await rootBundle.loadString("assets/files/catalogue.json");
    final catalogueJson = jsonDecode(encodeJson);
    final productsData = catalogueJson["products"];
    CatalogueModel.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if(CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                CatalogueList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
            ),
        ),
      ),
    );
  }
}


class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogueList extends StatelessWidget {
  const CatalogueList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items!.length,
      itemBuilder: (context, index){
        final Item catalogue = CatalogueModel.items![index];
        return CatalogueItem(catalogue: catalogue);
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
          CatalogueImage(image: catalogue.imgURL),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogue.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
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
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                    child: "Buy".text.make(),
                    )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
            ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}


// ListView.builder(
//           itemCount: CatalogueModel.items!.length,
//           itemBuilder: (context, index) => ItemWidget(
//               item: CatalogueModel.items![index],
//             ),
//         )

    // return Scaffold(
    //   appBar: AppBar(
    //     title:Text("Catalog App"),
    //   ),
    //   drawer: MyDrawer(),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: (CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
    //     ? GridView.builder(
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 16,
    //         crossAxisSpacing: 16,
    //         ),
    //       itemCount: CatalogueModel.items!.length,
    //       itemBuilder: (context, index){
    //         final item = CatalogueModel.items![index];
    //         return Card(
    //           clipBehavior: Clip.antiAlias,
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //           child: GridTile(
    //             header: Container(
    //               child: Text(
    //                 item.name,
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               decoration: BoxDecoration(
    //                 color: Colors.deepPurple,
    //               ),
    //               padding: const EdgeInsets.all(12),
    //             ),
    //             child: Image.network(
    //               item.imgURL,
    //             ),
    //             footer: Container(
    //               child: Text(
    //                 item.price.toString(),
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               decoration: BoxDecoration(
    //                 color: Colors.black,
    //               ),
    //               padding: const EdgeInsets.all(12),
    //             ),
    //           )
    //         );
    //       }
    //     )
    //     : Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    // );