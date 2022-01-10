import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/dark_theme_provider.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themechange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            //margin: EdgeInsets.only(top: 80),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/emptywishlist.png"),
                  fit: BoxFit.fill),
            )),
        Text("Your Wishlist Is Empty",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 36,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 30,
        ),
        Text("Explore more and shortlish some items",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themechange.darkTheme
                    ? Theme.of(context).disabledColor
                    : Color.fromRGBO(128, 128, 128, 0.8),
                fontSize: 26,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 30,
        ),
        
        Container(
          width: MediaQuery.of(context).size.height * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.red),
            ),
            color: Colors.redAccent,
            child: Text(
              "Add a Wish".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }
}
