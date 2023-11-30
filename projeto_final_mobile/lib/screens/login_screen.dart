import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }
  bool _showPassaword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Container(
              height: 580,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.white10,
                //borderRadius: BorderRadius.circular(12),
                //border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          icon: Icon(Icons.login_outlined),
                          border: OutlineInputBorder(),
                          hintText: 'e-mail',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
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
                        icon: Icon(Icons.lock),
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
                        child: Text('Entrar'),
                      ),
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
      ),
    );
  }
}
