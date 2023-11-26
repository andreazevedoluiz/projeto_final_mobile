import 'package:flutter/material.dart';
import 'package:projeto_final_mobile/components/task.dart';
import 'package:projeto_final_mobile/data/task_dao.dart';
import 'package:projeto_final_mobile/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text(
          "Tarefas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 8,
          bottom: 70,
        ),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: ((context, snapshot) {
            List<Task>? itens = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando...'),
                    ],
                  ),
                );
                break;

              case ConnectionState.waiting:
              return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando...'),
                    ],
                  ),
                );
                break;

              case ConnectionState.active:
              return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('carregando...'),
                    ],
                  ),
                );
                break;

              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isNotEmpty) {
                    return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (BuildContext context, index) {
                          final Task tarefa = itens[index];
                          return tarefa;
                        });
                  }
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          'Não há nenhuma rarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar tarefas');
                break;
            }
            return Text('Erro desconhecido');
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
