import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertut/controller/provider.dart';
import 'package:providertut/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyApp build');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Counter()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: MyHomePage(),
        ),
      ),
    );
  }
}
