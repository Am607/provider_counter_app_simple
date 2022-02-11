import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertut/controller/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _incrementcounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
      appBar: AppBar(
        title: Text("providerSample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times "),
            Text('$counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>  _incrementcounter(context), child: Icon(Icons.add)),
    );
  }
}
