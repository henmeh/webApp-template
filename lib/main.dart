import 'package:flutter/material.dart';
import '../routing/router.dart';
import '../services/navigation_service.dart';
import '../views/layout_template.dart';
import '../routing/route_names.dart';
import './locator.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Auction',
      theme: ThemeData(
          errorColor: Colors.red,
          highlightColor: Colors.white,
          primaryColor: Colors.black,
          backgroundColor: Colors.grey,
          accentColor: Colors.orange,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              headline5: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
              headline4: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
      builder: (context, child) => LayoutTemplate(child: child),
    );
  }
}
