import 'package:flutter/cupertino.dart';
import 'package:providertut/model/productModel.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _db = [];
  int _count = 0;



  List<Product> get db => _db;
  int get count => _count;

  void addProduct(Product product) {
    _db.add(product);
    notifyListeners();
  }

  void removeProduct(index) {
    _db.removeWhere((element) => db[index].name == element.name );
    notifyListeners();
  }

  int addCount() {
    _count++;
    notifyListeners();
    return _count;
  }

  
}
