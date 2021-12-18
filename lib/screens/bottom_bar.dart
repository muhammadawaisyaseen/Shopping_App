import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/feeds.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/search.dart';
import 'package:shopping_app/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  //We can do the same as with List but he is using Map

  // List _pages = [
  //   HomeScreen(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen()
  // ];

  List<Map<String, Widget>>? _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': HomeScreen(),
        //'title':'Home Screen'
      },
      {
        'page': FeedsScreen(),
        //'title':'Feeds Screen'
      },
      {
        'page': SearchScreen(),
        //'title':'Search Screen'
      },
      {
        'page': CartScreen(),
        //'title':'Cart Screen'
      },
      {
        'page': UserScreen(),
        //'title':'User Screen'
      },
    ];
  }

  int _selectedindex = 0;
  void selectedpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          // title: _pages[_selectedindex]['title'],
          ),
      body: _pages![_selectedindex]['page'],
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
            onTap: selectedpage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.red,
            currentIndex: _selectedindex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), tooltip: "home", label: "home"),
              //............................
              BottomNavigationBarItem(
                  icon: Icon(Icons.feed), tooltip: "feeds", label: "feeds"),
              //............................
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.transparent,
                  ),
                  tooltip: "search",
                  label: "search"),
              //............................
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  tooltip: "shoping bags",
                  label: "shoping bags"),
              //............................
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), tooltip: "user", label: "user"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        tooltip: "search",
        elevation: 5,
        child: Icon(Icons.search),
        onPressed: () {
          setState(() {
            _selectedindex = 2;
          });
        },
      ),
    );
  }
}
