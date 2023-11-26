import 'dart:async';
import 'package:flutter/material.dart';
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

  List<Task> toList(List<Map<String, dynamic>> mapasDetaraefas) {
    print('Convertanedo to list');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapasDetaraefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> findAll() async {
    print('acessando o findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('procurando dados no banco de dados ... encontrados: $result');
    return toList(result);
  }

  save(Task tarefa) async {
    print("Iniciando o save: ");
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já exisita');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> find(String nameDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nameDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando Tarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
