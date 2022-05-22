import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/helpers/driver_navigation.dart';
import 'package:untitled/screen/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Todo List")
      ),
     drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TodoScreen()),),
        child: Icon(Icons.add),
    )


    ,);
  }
}
