import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:shopping_app/inner_screens.dart/brands_navigation_rail%20copy.dart';
import 'package:shopping_app/widget/backlayer.dart';
//import 'package:shopping_app/inner_screens.dart/brands_navigation_rail%20copy.dart';
import 'package:shopping_app/widget/category.dart';
import 'package:shopping_app/widget/popular_products.dart';
//import 'package:card_carousel/card_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList1 = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
    "assets/images/carousel5.jpg",
  ];
  final List<String> brandimages = [
    "assets/images/addidas.jpg",
    "assets/images/apple.jpg",
    "assets/images/Dell.jpg",
    "assets/images/h&m.jpg",
    "assets/images/Huawei.jpg",
    "assets/images/nike.jpg",
    "assets/images/Dell.jpg",
    "assets/images/samsung.jpg"
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerHeight: MediaQuery.of(context).size.height * 0.25,
          appBar: BackdropAppBar(
            title: const Text("Home"),
            leading: const BackdropToggleButton(
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
                padding: const EdgeInsets.all(10),
                icon: const CircleAvatar(
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
          backLayer: BackLayerMenu(),
          frontLayer: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        items: imgList1
                            .map((item) => Container(
                                  child: Container(
                                    margin: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(5.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            //Image.network(imgList[0], fit: BoxFit.cover, width: 1000.0),
                                            Image.asset(imgList1[_current],
                                                fit: BoxFit.fill,
                                                width: 1000.0),
                                            Positioned(
                                              bottom: 0.0,
                                              left: 0.0,
                                              right: 0.0,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      const Color.fromARGB(
                                                          200, 0, 0, 0),
                                                      const Color.fromARGB(
                                                          0, 0, 0, 0)
                                                    ],
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                  ),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                child: const Text(
                                                  //'No. ${imgList.indexOf(item)} image',
                                                  "No matter we give text or not bcoz color is transparent",
                                                  style: const TextStyle(
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
                //-----------------------------

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Catagories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                Container(
                  // This is a parent Container and in "CategoryWidget()" container is child container
                  //(Child's height and width will not greater than Parent
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int myindex) {
                      // parameter index is coming from CategoryWidget Class.
                      return CategoryWidget(index: myindex);
                    },
                  ),
                ),
                //------------------------------

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Text("Popular Brands",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        )),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BrandNavigationRailScreen(
                            selectedIndex: 7,
                          ),
                        ));
                      },
                      child: const Text("View all...",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          )),
                    )
                  ]),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Swiper(
                    indicatorLayout: PageIndicatorLayout.SCALE,
                    autoplay: true,
                    autoplayDelay: 1800,
                    itemCount: brandimages.length,
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                    fade: 0.85,
                    viewportFraction: 0.85,
                    scale: 0.85,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          color: Colors.blueGrey,
                          child: Image.asset(
                            brandimages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Text("Popular Products",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        )),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {},
                      child: const Text("View all...",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                          )),
                    )
                  ]),
                ),
                Container(
                  width: double.infinity,
                  height: 285,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  //padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext ctx, int index) {
                      return const PopularProducts();
                    },
                  ),
                ),
                // FlatButton(
                //   onPressed: () {
                //     // Navigator.of(context).pushNamed(
                //     //   BrandNavigationRailScreen.routeName,
                //     //   arguments: {
                //     //     7,
                //     //   },
                //     // );
                //   },
                //   child: const Text(
                //     'View all...',
                //     style: TextStyle(
                //         fontWeight: FontWeight.w800,
                //         fontSize: 15,
                //         color: Colors.red),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
