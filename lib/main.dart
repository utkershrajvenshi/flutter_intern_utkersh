import 'package:flutter/material.dart';
import 'package:flutter_intern_utkersh/screens/all_ads.dart';
import 'package:flutter_intern_utkersh/screens/dashboard.dart';
import 'package:flutter_intern_utkersh/screens/listing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      routes: {
        Navigator.defaultRouteName: (context) => Dashboard(),
        '/1': (context) => Listing(ModalRoute.of(context).settings.arguments),
        '/2': (context) => AllAds(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
