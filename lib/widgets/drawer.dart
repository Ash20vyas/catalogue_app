import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL = "https://png.pngtree.com/png-clipart/20190115/ourlarge/pngtree-chibi-boy-with-glasses-png-image_318105.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding:EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin:EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text("Ashutosh Vyas"),
                accountEmail: Text("Ash20vyas@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style:TextStyle(
                      color: Colors.white,
                      )
                  ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                  ),
                  title: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style:TextStyle(
                      color: Colors.white,
                      )
                  ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                  ),
                  title: Text(
                    "Email",
                    textScaleFactor: 1.2,
                    style:TextStyle(
                      color: Colors.white,
                      )
                  ),
              )
          ],
        ),
      ),
    );
  }
}