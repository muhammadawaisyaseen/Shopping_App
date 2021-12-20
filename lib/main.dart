import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/consts/theme_data.dart';
import 'package:shopping_app/provider/dark_theme_provider.dart';
import 'package:shopping_app/screens/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themechangeprovider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themechangeprovider.darkTheme =
        await themechangeprovider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themechangeprovider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themedata, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themechangeprovider.darkTheme, context),
            home: BottomBarScreen(),
          );
        }));
  }
}
