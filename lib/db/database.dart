// import 'dart:async';
// import 'dart:core';
// import 'package:sqflite/sqflite.dart' as sql;
//
// class SQLhelper{
//   static Future<void>createTables(sql.Database database) async{
//     await database.execute("""CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//     Name TEXT,email TEXT,phone TEXT,password TEXT,createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
//      """);
//
//   }
// static Future<sql.Database> db() async{
// return sql.openDatabase(
//   'localdb.db',
//   version: 1,
//   onCreate: (sql.Database database,int version)
//     async{
//     await createTables(database);
//     }
//
// );
// }
//
// static Future<int> createItem(String name,String? email,String phone,String password) async{
//     final db =  await SQLhelper.db();
//     final data = {'Name': name,'Email':email,'Phone':phone,'Password':password};
//     final id = await db.insert('items',data,
//         conflictAlgorithm :sql.ConflictAlgorithm.replace);
//     return id;
//
// }
// static Future<List<Map<String,dynamic>>> getItems() async{
//     final db = await SQLhelper.db();
//     return db.query('items', orderBy:  "id");
// }
//
// static Future<List<Map<String,dynamic>>>getItem(int id) async{
//     final db = await SQLhelper.db();
//     return db.query('items',where: "id = ?",whereArgs: [id],limit: 1);
// }
//
// static Future<int>
// }