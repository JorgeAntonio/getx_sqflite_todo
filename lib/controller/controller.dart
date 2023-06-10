import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite_todo/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  late Database database;

  void createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
  }

  void deleteTheDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
  }

  void openAppDatabase({required String path}) async {
    // open the database
    await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time TEXT, favorite INTEGER, completed INTEGER)');
        debugPrint('Database Created');
        print('Database Created');
      },
      onOpen: (Database db) {
        database = db;
        debugPrint('Database Opened');
        getAllData();
      },
    );
  }

  List<TodoModel> list = [];
  List<TodoModel> listFavorite = [];

  void getAllData() async {
    list.clear();
    listFavorite.clear();
    var alldata = await database.query('todo');
    for (var data in alldata) {
      list.add(TodoModel.fromJson(data));
      if (data['favorite'] == 1) {
        listFavorite.add(TodoModel.fromJson(data));
      }
    }
    update();
    debugPrint('Favorite List $listFavorite');
  }

  void insertData({
    required String title,
    required String description,
    required String time,
  }) async {
    try {
      var values = {
        'title': title,
        'description': description,
        'time': time,
        'favorite': 0,
        'completed': 0,
      };

      var data = await database.insert(
        'todo',
        values,
      );
      Get.back();
      debugPrint('Data Inserted $data');
      getAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool updateTodo = false;

  void updateData({
    required String title,
    required String description,
    required String time,
    required int id,
  }) async {
    try {
      var values = {
        'title': title,
        'description': description,
        'time': time,
        'favorite': 1,
        'completed': 1,
      };

      var data = await database.update(
        'todo',
        values,
        where: "id = $id",
      );
      Get.back();
      debugPrint('Data Updated $data');
      getAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async {
    var data = await database.delete(
      'todo',
      where: "id = $id",
    );
    update();
    debugPrint('Data Deleted $data');
    getAllData();
  }

  void updateFavorite(int i, int j) {
    var values = {
      'favorite': j,
    };

    database.update(
      'todo',
      values,
      where: "id = $i",
    );
    getAllData();
  }

  void updateCompleted(int i, int j) {
    var values = {
      'completed': j,
    };

    database.update(
      'todo',
      values,
      where: "id = $i",
    );
    getAllData();
  }
}
