import 'package:flutter/material.dart';
import '../routing/route_names.dart';
import '../services/navigation_service.dart';
import '../locator.dart';
import 'button.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final buttoncolors = {
    0: Colors.pink,
    1: Colors.blueAccent,
    2: Colors.blueAccent
  };

  _changeSide(List _arguments) {
    locator<NavigationService>().navigateTo(_arguments[0]);
    setState(() {
      for (var i = 0; i < buttoncolors.length; i++) {
        buttoncolors[i] = Colors.blueAccent;
      }
      buttoncolors[_arguments[1]] = Colors.pinkAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850].withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          button(buttoncolors[0], Colors.white, "Button 3", _changeSide,
              [HomeRoute, 0]),
          SizedBox(height: 20),
          button(buttoncolors[1], Colors.white, "Button 4", _changeSide,
              [Button4Route, 1]),
          SizedBox(height: 20),
          button(buttoncolors[2], Colors.white, "Button 5", _changeSide,
              [Button5Route, 2]),
        ],
      ),
    );
  }
}
