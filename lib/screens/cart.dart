import 'package:flutter/material.dart';

import 'cart_empty.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartEmpty(),
    );
  }
}