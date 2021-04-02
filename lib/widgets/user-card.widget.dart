import 'package:flutter/material.dart';
import 'package:todomobile/components/avatar.widget.dart';
import 'package:todomobile/views/login.view.dart';

class UserCard extends StatelessWidget {
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
            width: 120,
            path:
                "https://scontent.fsod2-1.fna.fbcdn.net/v/t1.6435-9/168394212_299370788431321_3900932130757447149_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=730e14&_nc_ohc=YQ7xqBlXyEMAX_amJr_&_nc_ht=scontent.fsod2-1.fna&oh=3b2df52e07cfafc2b36cc5d25922d383&oe=608E77D1",
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Vinícius Espinosa",
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ),
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
