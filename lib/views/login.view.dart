import 'package:flutter/material.dart';
import 'package:todomobile/components/button.widget.dart';
import 'package:todomobile/views/home.view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/logo-completa.png",
                  width: 250,
                ),
                SizedBox(
                  height: 120,
                ),
                Text(
                  "Seja bem vindo(a)",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                TDButton(
                  text: "Entrar com Google",
                  image: "assets/images/google.png",
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
