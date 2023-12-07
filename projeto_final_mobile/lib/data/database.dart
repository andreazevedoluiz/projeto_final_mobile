
import 'package:projeto_final_mobile/data/task_dao.dart';
import 'package:projeto_final_mobile/data/login_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}


Future<Database> loginDataBase() async {
  final String path = join(await getDatabasesPath(), 'login.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}

