import 'package:flutter/material.dart';

import 'cart_empty.dart';
import 'cart_full.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = [];
    return  Scaffold(
      body: !products.isEmpty? CartEmpty():CartFull(),
    );
  }
}
