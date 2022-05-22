import 'package:sqflite/sqflite.dart';
import 'dataBase_connetion.dart';
import 'package:intl/intl.dart';
class Repository{
  //database connetion
  DataBaseConnection? _dataBaseConnection;
  Repository(){
    _dataBaseConnection= DataBaseConnection();
}
  static Database? _database;
   Future<Database?> get dataBase async{
  if (_database!=null) return _database;
  _database ??= await _dataBaseConnection?.setDataBase();
  return _database;
}

//insert data to table
insetData(table , data) async {
      var connection= await dataBase;
      return await connection?.insert(table,data);
}
  updateData(table, data) async{
     var connection=await dataBase;
     return await connection?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }
//read data from table
readData(table) async{
 var connection= await dataBase;
 return await connection?.query(table);
}
readDataById(table,itemId) async{
  var connection=await dataBase;
  return await connection?.query(table,
  where: 'id=?',whereArgs:[itemId] );
}
deleteData(table, itemId) async{
  var connection=await dataBase;
  return await connection?.rawDelete(" DELETE FROM $table WHERE id=$itemId");
}
  static Database? _database1;
  Future<Database?> get dataBase1 async{
    if (_database1!=null) return _database;
    _database1 ??= await _dataBaseConnection?.setDataBase();
    return _database1;
  }
  insetData1(table , data) async {
    var connection = await dataBase1;
    return await connection?.insert(table, data);
  }
  readData1(table) async{
    var connection= await dataBase1;
    return await connection?.query(table);
  }
  readDataById1(table,itemId) async{
    var connection=await dataBase1;
    return await connection?.query(table,
        where: 'id=?',whereArgs:[itemId] );
  }
}