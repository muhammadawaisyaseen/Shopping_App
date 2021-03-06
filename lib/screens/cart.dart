import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';

import '../widget/cart_empty.dart';
import '../widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty
        ? Scaffold(
            body: CartEmpty(),
          )
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              title: Text("Cart Items Count"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CartFull();
                  }),
            ));
  }

// Bottomsheet widget (Above bottom bar)
  Widget checkoutSection(BuildContext ctx) {
    return Container(
      //margin: EdgeInsets.only(top: 30),
      //child: Text("This is bottomsheet"),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ])),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Checkout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(ctx).textSelectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "Total",
              style: TextStyle(
                  color: Theme.of(ctx).textSelectionColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "US \$ 179.0",
              style: TextStyle(
                  //color: Theme.of(ctx).textSelectionColor,
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
