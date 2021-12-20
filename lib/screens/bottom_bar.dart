import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/consts/my_icons.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/feeds.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/search.dart';
import 'package:shopping_app/screens/user_info.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  //We can do the same as with List but we can use Map and then use var

  // List _pages = [
  //   HomeScreen(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen()
  // ];

  var _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': HomeScreen()},
      {'page': FeedsScreen()},
      {'page': SearchScreen()},
      {'page': CartScreen()},
      {'page': UserInfo()},
    ];
  }

  int _selectedindex = 4;
  void selectedpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text(_pages[_selectedindex]['title'])),
      // ),
      body: _pages![_selectedindex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration:
              const BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
            onTap: selectedpage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedindex,
            //selectedFontSize: 16,
            selectedLabelStyle: const TextStyle(fontSize: 16),
            items: [
              BottomNavigationBarItem(
                  icon: FaIcon(MyAppIcons.home),
                  tooltip: "home",
                  label: "home"),
              //............................
              BottomNavigationBarItem(
                  icon: FaIcon(MyAppIcons.rss),
                  tooltip: "feeds",
                  label: "feeds"),
              //............................
              BottomNavigationBarItem(
                  icon: FaIcon(
                    MyAppIcons.search,
                    color: Colors.transparent,
                  ),
                  tooltip: "search",
                  label: "search"),
              //............................
              BottomNavigationBarItem(
                  icon: FaIcon(MyAppIcons.cart),
                  tooltip: "shoping bags",
                  label: "cart"),
              //............................
              BottomNavigationBarItem(
                  icon: FaIcon(MyAppIcons.user),
                  tooltip: "user",
                  label: "user"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          tooltip: "search",
          elevation: 5,
          child: FaIcon(MyAppIcons.search),
          onPressed: () {
            setState(() {
              _selectedindex = 2;
            });
          },
        ),
      ),
    );
  }
}
