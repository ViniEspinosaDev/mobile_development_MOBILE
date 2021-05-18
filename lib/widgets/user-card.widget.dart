import 'package:flutter/material.dart';
import 'package:todomobile/components/avatar.widget.dart';
import 'package:todomobile/controllers/login.controller.dart';
import 'package:todomobile/user.dart';
import 'package:todomobile/views/login.view.dart';

class UserCard extends StatelessWidget {
  final controller = new LoginController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage("assets/images/user-card-back.png"),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TDAvatar(
            width: 100,
            path: user.picture,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            user.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          TextButton(
            child: Text(
              "Sair",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              controller.logout().then(
                (data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
