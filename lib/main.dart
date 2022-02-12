import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertut/controller/api.dart';
import 'package:providertut/controller/provider.dart';
import 'package:providertut/view/home.dart';

import 'controller/prdtProvider.dart';

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
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider.value(value: Counter()),
        FutureProvider(create: (_) => getName(), initialData: 'Load...'),
        FutureProvider(create: (_) => getName(), initialData: 'Loading...'),

        // can also place in the Ui side
        StreamProvider(create: (_) => getSessionTime(), initialData: 0),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: MyHomePage(),
        ),
      ),
    );
  }
}
