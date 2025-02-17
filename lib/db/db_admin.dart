import 'dart:io';

import 'package:flutter_gastosapp/models/gasto_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin _instance = DBAdmin._();
  DBAdmin._();

  factory DBAdmin() {
    return _instance;
  }

  Future<Database?> _checkDatabase() async {
    if (myDatabase == null) {
      //AÚN NO SE HA CREADO MYDATABASE
      myDatabase = await _initDatabase();
    }
    print("aqui");
    return myDatabase;

    // myDatabase ??= await initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(directory.path, "PagosDB.db");
    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""CREATE TABLE GASTOS(
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                title TEXT, 
                price REAL, 
                datetime TEXT, 
                type TEXT
              )""");
      },
    );
  }

  //INSERCIÓN DE DATOS
  Future<int> insertarGasto(GastoModel gasto) async {
    Database? db = await _checkDatabase();
    int res = await db!.insert(
      "GASTOS",
      gasto.ConvertirMap(),
      // {
      //   "title": "Compra de medias",
      //   "price": 10.50,
      //   "datetime": "12/12/2024",
      //   "type": "Otros",
      // },
    );
    print(res);
    return res;
  }

  //OBTENCIÓN DE DATOS
  Future<List<GastoModel>> obtenerGastos() async {
    Database? db = await _checkDatabase();
    List<Map<String, dynamic>> data = await db!.query("GASTOS");

    List<GastoModel> gastosList =
        data.map((e) => GastoModel.fromDB(e)).toList();

    // List<Map<String, dynamic>> data =
    //     await db!.rawQuery("SELECT TITLE FROM GASTOS WHERE TYPE='Otros'");
    // List<Map<String, dynamic>> data =
    // await db!.query("GASTOS", where: "TYPE='Otros'");
    // print(data);
    // print(gastosList);
    return gastosList;
  }

  //UPDATE GASTO
  updGasto() async {
    Database? db = await _checkDatabase();
    int res = await db!.update(
        "GASTOS",
        {
          "title": "ACTUALIZADO",
          "price": 10.1,
          "type": "Banco",
        },
        where: "id=2");
    print(res);
  }

  //DELETE
  delGasto(int id) async {
    Database? db = await _checkDatabase();
    int res = await db!.delete("GASTOS", where: 'id=$id');
    print(res);
  }
}