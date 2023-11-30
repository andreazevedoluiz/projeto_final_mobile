import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
    bool _showPassaword = false;


  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Cadastro de Usuário',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 580,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.white10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text){
                        setState(() {
                        });
                      } ,
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          fillColor: Colors.white70,
                          filled: true),
                ),),
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text){
                        setState(() {
                        });
                      } ,
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o e-mail!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'e-mail',
                          fillColor: Colors.white70,
                          filled: true),
                ),),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira a senha!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: password,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'senha',
                        fillColor: Colors.white70,
                        filled: true,
                        suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassaword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassaword = !_showPassaword;
                              });
                            }),
                      ),
                      obscureText: _showPassaword == false ? true : false,
                    ),
                  ),
                   Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cadastrar'),
                      ),
                      ],
                      ),       
              ],
            ),
          ),
        ),
      ),
    );
  }
}
