import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            //margin: EdgeInsets.only(top: 80),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/emptycart.png"),
                  fit: BoxFit.fill),
            )),
        Text("Your Cart Is Empty",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 36,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 30,
        ),
        Text("Looks like You didn\'t \n add anything to your cart yet",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 26,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
