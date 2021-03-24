import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:js/js_util.dart';
import '../widgets/javascript_controller.dart';
import './button.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String addresse;
  final buttoncolors = {
    0: Colors.blueAccent,
    1: Colors.blueAccent,
  };

  _logIn() async {
    var promise = login();
    var logIn = await promiseToFuture(promise);
    setState(
      () {
        addresse = logIn;
      },
    );
  }

  _logOut() async {
    var promise = logout();
    await promiseToFuture(promise);
    setState(
      () {
        addresse = null;
      },
    );
  }

  _checkforloggedIn() async {
    var promise = loggedIn();
    var loggedin = await promiseToFuture(promise);
    setState(() {
      addresse = loggedin;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkforloggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850].withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "WebSite Title",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Row(
            children: [
              addresse != null
                  ? Container(
                      child: Text(
                        addresse,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  : button(buttoncolors[0], Colors.white, "LogIn", _logIn),
              SizedBox(width: 20),
              button(buttoncolors[1], Colors.white, "LogOut", _logOut)
            ],
          )
        ],
      ),
    );
  }
}
