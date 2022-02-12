import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertut/controller/api.dart';
import 'package:providertut/controller/prdtProvider.dart';
import 'package:providertut/model/productModel.dart';

class MyHomePageTwo extends StatelessWidget {
  MyHomePageTwo({Key? key}) : super(key: key);

  //  final TextEditingController controller = TextEditingController();
  //  final TextEditingController controller2 = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? productName;
  String? productPrice;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context);

    print('MyHomePageTwo build');
    return Scaffold(
        appBar: AppBar(
          title: Text(context.watch<String>()),

          //! HERE Consumer is more powerful than Provider.of<>() or watch()
          //! Consumer is used to access the data from  provider  also,
          //! but here its a stream
          //! the widget is not going to rebuild if the data changes
          leading: Row(
            children: [
              Consumer<int>(
                builder: (_, count, __) => Center(
                    child: Text(
                  '$count',
                  style: TextStyle(fontSize: 20),
                )),
              ),
              // SizedBox(
              //   width: 10,

              // ),
              // StreamProvider(
              //   create: (_) => getSessionTime(),
              //   initialData: 1,
              //   child: Consumer<int>(
              //     builder: (_, count, __) => Center(
              //         child: Text(
              //       '$count',
              //       style: TextStyle(fontSize: 13),
              //     )),
              //   ),
              // )
            ],
          ),

          actions: [
            Center(
                child: Selector<ProductProvider, int>(
              selector: (_, value) => value.count,
              builder: (_, count, __) => Text(
                '${count.toString()}',
                style: TextStyle(fontSize: 20),
              ),
            ))
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //! FutureBuilder is used to get the data from the API inside the UI
                FutureProvider(
                  create: (_) => getTime(),
                  initialData: 'Loading Time...',
                  child: Consumer<String>(
                    builder: (_, time, __) => Center(
                      child: Text(
                        '$time',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                  ),
                  onSaved: (value) {
                    productName = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Price',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    productPrice = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Add Product'),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();

                        controller.addProduct(
                          Product(
                            '$productName',
                            '$productPrice',
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Add cound'),
                      onPressed: () {
                        controller.addCount();
                        context.read<ProductProvider>().addCount();
                      },
                    ),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    // itemCount: controller.db.length,
                    itemCount: context.watch<ProductProvider>().db.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //! consumer method
                        // title: Consumer<ProductProvider>(
                        //   builder: (_, notifier, __) =>
                        //       Text('Item Name : ${notifier.db[index].name}'),
                        // ),
                        // subtitle: Consumer<ProductProvider>(
                        //   builder: (_, notifier, __) =>
                        //       Text('Item Price: ${notifier.db[index].price}'),
                        // ),

                        //  trailing: Consumer<ProductProvider>(
                        //   builder: (_, notifier, __) => IconButton(
                        //     icon: Icon(Icons.delete),
                        //     color: Colors.red,
                        //     onPressed: () {
                        //       notifier.removeProduct(index);
                        //     },
                        //   ),
                        // ),
                        title: Text(
                            'Item Name : ${context.watch<ProductProvider>().db[index].name}'),

                        subtitle: Text(
                            'Item Price: ${context.watch<ProductProvider>().db[index].price}'),

                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            context.read<ProductProvider>().removeProduct(
                                index); // read is user when we call a function
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}



// reads
//========
// ChangeNotifierProvider
// StreamProvider
// FutureProvider
// Selector > Consumer > read > watch 
//! HERE Consumer is more powerful than Provider.of<>() or watch()
//! Consumer is used to access the data from  provider  also,
//! but here its a stream
//! the widget is not going to rebuild if the data changes
// stramProvider and Future provider can also use with in the ui or widger tree
// provider is not A state management library is only giving data to the widget tree

