import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/app.dart';

import '../models/todo.dart';
import '../services/todo_services.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todo;
  var todoTitleController=TextEditingController();
  var todoDescriptionController=TextEditingController();
  var todoDateController=TextEditingController();

  var _seletedValue;
  var _categories;
  var _todo =Todo();
  var _toDoService= ToDoService();
  List<Todo> _todoList=List<Todo>.empty(growable:true);
  getAllToDo() async{
    var todo=await _toDoService.readToDo();

    todo.forEach((todo){
      setState((){
        var toDoModel= Todo();
        toDoModel.title=todo['title'];
        toDoModel.id=todo['id'];
        toDoModel.description=todo['description'];
        toDoModel.category=todo['category'];
        toDoModel.todoDate=todo['todoDate'];
        _todoList.add(toDoModel);
      });

    });


  }
  _showFormToDoDialog(BuildContext context){
    return showDialog(context: context,
        barrierDismissible: true,
        builder:(param){
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                  color: Colors.red,
                  onPressed: ()=> Navigator.pop(context),
                  child: Text("Cancel")),
              FlatButton(
                  color: Colors.green,
                  onPressed: () async {
                    // _category.id=category[0]['id'];
                    _todo.title=todoTitleController.text;
                    _todo.description=todoDescriptionController.text;
                    _todo.todoDate=todoDateController.text;
                    var result = await _toDoService.saveToDo(_todo);
                    //print(result);
                    if(result>0){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>
                      TodoScreen()),(Route <dynamic> route) => false);
                    }
                  },
                  child: Text("Save"))
            ],
            title: Text("Todo Form"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Write a category',
                        labelText: 'Category'
                    ),
                    controller:todoTitleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Write a description',
                        labelText: 'Description'
                    ),
                    controller: todoDescriptionController,
                  ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Write a description',
                  labelText: 'Date'
              ),
              controller: todoDateController,)
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Todo"),
      ),
      body: Padding(

        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: todoTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Write Todo Title'
              ),
            ),
            TextField(
              controller: todoDateController,
              decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'Pick a Date',
                  prefixIcon: InkWell(
                    onTap:(){}//odevde doldurulacak
                     ,
                    child: Icon(Icons.calendar_today),
                  )
              ),


            ),
            TextField(
              controller: todoDescriptionController,
              decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Write Todo description'),

            ),
            //odev ıtemler biz yapcaz
            DropdownButtonFormField(items: _categories,
                value: _seletedValue,
                onChanged: (value){
                   setState((){
                     _seletedValue=value;
                   });
                }),
            SizedBox(
              height: 20,
              
            ),
            RaisedButton(onPressed: (){},
            color: Colors.blue,
            child: Text("Save",style: TextStyle(color: Colors.purple),),)//biz işlemlerimiz ile dolduracagız
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFormToDoDialog(context);
        },
        child: Icon(Icons.add),
      ),

    );

  }
}
