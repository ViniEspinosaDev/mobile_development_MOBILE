import 'package:flutter/material.dart';
import 'package:todomobile/components/button.widget.dart';
import 'package:todomobile/controllers/login.controller.dart';
import 'package:todomobile/views/home.view.dart';
import 'package:todomobile/widgets/busy.widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = new LoginController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  handleSignIn() {
    setState(() {
      busy = true;
    });
    controller.login().then((data) {
      onSuccess();
    }).catchError((error) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }

  onError() {
    var snackBar = new SnackBar(content: new Text("Falha no login"));
    ScaffoldMessengerState().showSnackBar(snackBar);
  }

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: TDBusy(
            busy: busy,
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
                      handleSignIn();
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
      ),
    );
  }
}
