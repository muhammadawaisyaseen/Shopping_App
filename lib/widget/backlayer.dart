import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/consts/my_icons.dart';
import 'package:shopping_app/consts/routes.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/feeds.dart';

class BackLayerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorsConsts.starterColor,
                  ColorsConsts.endColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Positioned(
          top: -100.0,
          left: 140.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 100.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              width: 150,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          left: 60.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      //   clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                content(context, () {
                  navigateto(context, MyRoutes.routefeeds);
                }, 'Feeds',0),
                const SizedBox(height: 10.0),
                content(context, () {
                  navigateto(context, MyRoutes.routecart);
                }, 'Cart',1),
                const SizedBox(height: 10.0),
                content(context, () {
                  navigateto(context, MyRoutes.routefeeds);
                }, 'Wishlist',2),
                const SizedBox(height: 10.0),
                content(context, () {
                  navigateto(context, MyRoutes.routefeeds);
                }, 'Upload new Product',3),
              ],
            ),
          ),
        ),
      ],
    );
  }

//List of Icons that we will use for backlayer (screen)
List _contentIcons=[

  MyAppIcons.rss,
  MyAppIcons.cart,
  MyAppIcons.wishlist,
  MyAppIcons.uploadproduct,
];


// Navigation routes function
  void navigateto(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }

//Following is the generic widget that will call again and again for our on demand
  Widget content(BuildContext ctx, final Function() fct, String text,int index) {
    return InkWell(
      onTap: fct,
      //() {
      //Navigator.of(ctx).pushNamed(MyRoutes.routebacklayer);
      //},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          FaIcon(_contentIcons[index]),
          //FaIcon(FontAwesomeIcons.rss),
        ],
      ),
    );
  }
}
