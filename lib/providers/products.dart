import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Tommy Hilfiger T Shirt',
      description: 'A Tommy Hilfiger T Shirt - it is pretty cool!',
      price: 29.99,
      imageUrl:
          'https://assets.ajio.com/medias/sys_master/root/h6d/hdf/16111127592990/-1117Wx1400H-460617420-grey-MODEL.jpg',
          // 'https://toppng.com/uploads/preview/white-t-shirt-front-11563545790ekdvnznxsd.png',
    ),
    Product(
      id: 'p2',
      title: 'Gucci Jeans',
      description: 'A nice pair of jeans.',
      price: 3100,
      imageUrl:
          'https://cdn.luxatic.com/wp-content/uploads/2015/07/The-top-ten-most-expensive-jeans-brands-00006.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          // 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
          'https://static.cilory.com/117774-thickbox_default/red-riding-spectra-yellow-scarf.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          // 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
          'https://www.ikea.com/in/en/images/products/kavalkad-frying-pan-black__0241981_pe381624_s5.jpg?f=xs',
    ),
  ];

  // var _showFavouritesOnly = false;

  List<Product> get items {
    // if (_showFavouritesOnly) {
    //   return [..._items.where((product) => product.isFavourite).toList()];
    // } else {
    return [..._items];
    // }
  }

  // void showFavouritesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }

  List<Product> get favouriteItems {
    return _items.where((product) => product.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // _items.add(val);
    notifyListeners();
  }
}
