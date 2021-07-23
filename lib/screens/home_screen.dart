import 'package:flutter/material.dart';
import 'package:catalogue_app/widgets/drawer.dart';
class HomeScreen extends StatelessWidget 
{
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    final count = 1;
    final name = "Ashutosh Vyas";
    return Scaffold(
      appBar: AppBar(
        title:Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my $count\st flutter project!\nMade by $name"),
        ),
      ),
      drawer: MyDrawer(),
      );
  }
}