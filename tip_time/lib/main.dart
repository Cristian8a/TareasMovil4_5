import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/home_page.dart';
import 'package:tip_time/tiptime_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: HomePage(),
      ),
    );
  }
}
