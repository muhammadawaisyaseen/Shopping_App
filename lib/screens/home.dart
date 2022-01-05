import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:card_carousel/card_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/images/carousel1.png',
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
    "assets/images/carousel5.jpg",
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height * 0.25,
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
              ])),
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
          frontLayer: Column(
            children: [
              Container(
                  child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.vertical,
                        autoPlay: true,
                      ),
                      items: imgList
                          .map((item) => Container(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          //Image.network(imgList[0], fit: BoxFit.cover, width: 1000.0),
                                          Image.asset(imgList[_current],
                                              fit: BoxFit.fill, width: 1000.0),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                              child: Text(
                                                //'No. ${imgList.indexOf(item)} image',
                                                "No matter we give text or not bcoz color is transparent",
                                                style: TextStyle(
                                                  color: Colors.transparent,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ))
                          .toList())),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text("Popular Brands",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      )),
                  Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text("View all...",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        )),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
