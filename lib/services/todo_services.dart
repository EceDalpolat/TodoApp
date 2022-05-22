import 'package:untitled/repositories/repository.dart';

import '../models/todo.dart';

class ToDoService{
  Repository? _repository;
  ToDoService(){
    _repository= Repository();
  }

  get toDoId => null;
  saveToDo(Todo todo) async{
    return await _repository?.insetData1('todos', todo.todoMapp());

  }
  readToDo() async{
    return await _repository?.readData1('todos');
  }
  readToDoById(categoryId)async {
    return await _repository?.readDataById1('todos',toDoId);
  }}