import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbAdmin{

  Database? myDatabase;

  Future<Database?> checkDatabase() async{
    if(myDatabase == null){
      myDatabase = await initDatabase();
    }else{
      return myDatabase;
    }
  }

  Future<Database?> initDatabase() async{
    Directory directory = await getApplicationCacheDirectory();
    String pahtDatabase = join(directory.path,"PagosDB.db");
    return await openDatabase(
      pahtDatabase,
      version: 1, 
      onCreate: (Database db, int version){
        db.execute("""CREATE TABLE GATOS(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT, 
        price REAL, 
        datetime TEXT, 
        type TEXT)"""
        );
      });
  }
}