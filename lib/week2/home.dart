import 'package:flutter/material.dart';

import 'supplemental/aymmetric_view.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  // tODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // tODO: Return an AsymmetricView (104)
    // tODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () => print('menu'),
        ),
        title: Text('Shrine'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () => print('filter'),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () => print('search'),
          )
        ],
      ),
      // tODO: Add a grid view (102)
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
