import 'dart:convert';

import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:catalogue_app/widgets/home_widgets/catalogue_header.dart';
import 'package:catalogue_app/widgets/home_widgets/catalogue_list.dart';
import 'package:catalogue_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          // padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              10.heightBox,
              if(CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                CatalogueList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ).px32().pOnly(top: 32),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart,color: Colors.white,),
        backgroundColor: context.theme.buttonColor,
      ),
    );
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