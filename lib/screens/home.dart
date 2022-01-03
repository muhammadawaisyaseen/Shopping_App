import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height*0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorsConsts.starterColor,
                ColorsConsts.endColor
              ])
            ),
          ),    
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              iconSize: 15,
              padding: EdgeInsets.all(10),
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      "https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg"),
                ),
              ),
            ),
          ],
        ),
        backLayer: Center(
          child: Text("Back Layer"),
        ),
        frontLayer: Center(
          child: Text("Front Layer"),
        ),
      ),
    ));
  }
}
