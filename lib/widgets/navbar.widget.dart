import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton(
            child: Text(
              "Hoje",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              "Amanhã",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              "Todas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
