// sqflite helper

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

const String _kTableName = "Tasks";

class SqfliteHelper {
  late Database db;

  //! initDatabase
  Future<void> initDB() async {
    //? step 1 => Create database
    await openDatabase(
      'tasks.db',
      version: 1,
      // first time only create database
      onCreate: (Database db, int v) async {
        //? step 2 => create table
        return await db.execute('''
      CREATE TABLE $_kTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT ,
        title TEXT,
        note TEXT,
        date TEXT,
        startTime TEXT,
        endTime TEXT,
        color INTEGER,
        isCompleted INTEGER)''');
      },
    ).then((value) => db = value);
  }

  //! get all tasks
  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM $_kTableName');
  }

  //! insert task
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''
      INSERT INTO $_kTableName
      (title ,note ,date ,startTime ,endTime ,color , isCompleted)
        VALUES
        ('${model.title}','${model.note}','${model.date}','${model.startTime}',
       '${model.endTime}','${model.color}' ,'${model.isCompleted}')''');
  }

  //! update task

  Future<int> updatedDB(int id) async {
    return await db.rawUpdate('''
    UPDATE $_kTableName
    SET isCompleted = ?
    WHERE id = ?
   ''', [1, id]); //! 1 => true  => Make the task complete
  }

  //! delete task
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete(
      '''DELETE FROM $_kTableName WHERE id = ?''',
      [id],
    );
  }

  //! delete all tasks
  Future<int> deleteAllFromDB() async {
    return await db.rawDelete('''DELETE FROM $_kTableName''');
  }
}
