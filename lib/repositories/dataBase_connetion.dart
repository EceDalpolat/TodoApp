import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
class DataBaseConnection{
  setDataBase()async{
       var directory=await getApplicationDocumentsDirectory();
       var path=join(directory.path, 'db_to_do_list_sqflşte');
       var dataBase= await openDatabase(path,version: 1,onCreate: _onCreateDataBase);
       return dataBase ;

  }
  _onCreateDataBase(Database database, int version) async{
    await database.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT,description TEXT)");
  }
  setDataBase1()async{
    var directory=await getApplicationDocumentsDirectory();
    var path=join(directory.path, 'db_to_do_list_sqflşte');
    var dataBase1=await openDatabase(path,version: 1,onCreate: _takvimTablosu);
    return dataBase1 ;

  }
  _takvimTablosu(Database database1 , int version) async{
    await database1.execute(
      "CREATE TABLE todos (id INTEGER PRIMARY KEY, title TEXT, description TEXT, category TEXT, todoDate TEXT)"
    );
  }
}