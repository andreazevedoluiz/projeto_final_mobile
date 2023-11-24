import 'dart:async';
import 'dart:js_util';
import 'package:projeto_final_mobile/components/task.dart';
import 'package:projeto_final_mobile/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) {
    Future<List<Task>> findAll() async {
      print('acessando o findAll');
      final Database bancoDeDados = await getDatabase();
      final List<Map<String, dynamic>> result =
          await bancoDeDados.query(_tablename);
      print('procurando dados no banco de dados ... encontrados: $result');
      return tolist()
    }

    Future<List<Task>> find(String nameDaTarefa) async {}
    delete(String nomeDaTarefa) async {}
  }
}
