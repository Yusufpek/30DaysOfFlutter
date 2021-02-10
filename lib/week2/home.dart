import 'package:flutter/material.dart';

import 'supplemental/aymmetric_view.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  final Category category;
  HomePage({this.category: Category.all});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(category),
      ),
    );
  }
}
