import 'package:flutter/material.dart';
import 'package:projeto_final_mobile/components/task.dart';
import 'package:projeto_final_mobile/data/task_dao.dart';
import 'package:projeto_final_mobile/data/task_inherited.dart';
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
              switch(snapshot.connectionState){

                case ConnectionState.none:
                break;

                case ConnectionState.waiting:
                break;

                case ConnectionState.active:
                break;
                
                case ConnectionState.done:
                if (snapshot.hasData && itens != null){
                  if(itens.isNotEmpty){
                    return ListView.builder(itemCount: itens.length, 
                itemBuilder: (BuildContext context, index) {
                final Task tarefa = itens[index];
                return tarefa;
              }); 
                  }

                }
                break;

              }
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
