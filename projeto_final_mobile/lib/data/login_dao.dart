import 'package:flutter/material.dart';
import 'package:projeto_final_mobile/data/database.dart';
import 'package:projeto_final_mobile/screens/registerLogin_screen.dart';
import 'package:sqflite/sqflite.dart';

class LoginDao {
  static const String loginSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_email TEXT, '
      '$_password TEXT)';

  static const String _tablename = 'loginTable';
  static const String _name = 'name';
  static const String _email = 'difficulty';
  static const String _password = 'image';

  save(RegisterScreen cadastro) async {}
  Future<List<RegisterScreen>> findAll() async {
    final Database bancoLogin = await loginDataBase();
    final List<Map<String, dynamic>> result =
        await bancoLogin.query(LoginDao._tablename);
    return toListLogin(result);
  }

  List<RegisterScreen> toListLogin(List<Map<String, dynamic>> listaDeLogin) {
    final List<RegisterScreen> logins = [];
    for (Map<String, dynamic> linha in listaDeLogin) {
      final RegisterScreen login =
          const RegisterScreen();
          logins.add(login);
    }
    return logins;
  }

  Future find1(String email) async {}
  Future find2(String senha) async {}
}
