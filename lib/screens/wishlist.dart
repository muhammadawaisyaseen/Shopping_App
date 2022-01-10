import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/widget/wishlist_empty.dart';
import 'package:shopping_app/widget/wishlist_full.dart';

import '../widget/cart_empty.dart';
import '../widget/cart_full.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isEmpty
        ? Scaffold(
            body: WishlistEmpty(),
          )
        : Scaffold(
            body: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return WishlistFull();
                }));
  }
}
