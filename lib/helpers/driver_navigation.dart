
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/categories_screen.dart';
import 'package:untitled/screen/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child:Drawer(
     child: ListView(
     children: <Widget>[
       UserAccountsDrawerHeader(
           currentAccountPicture: CircleAvatar(
             backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/614/838/png-transparent-cat-kitty-creative-cat-cat.png"),
           ),
           accountName: Text("test"),
           accountEmail: Text("admin.admin"),
           decoration: BoxDecoration(color: Colors.blue),
       ),
           ListTile(
             leading: Icon(Icons.home),
             title: Text("home"),
             onTap:()=>Navigator.of(context).push(
               MaterialPageRoute(builder: (context)=>HomeScreen())
             ) ,//tıklqmq istediğim yer burası'''

           ),
           ListTile(
             leading: Icon(Icons.view_list),
             title: Text("Categories"),
             onTap: ()=>Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=>CategoriesScreen())),
           )
     ],),)
    ,);
  }
}
