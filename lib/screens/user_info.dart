import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: userTitle(context, "User Information"),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        userListTile(context, "Email", "Email", 0),
        userListTile(context, "phone number", "03407161459", 0),
        userListTile(context, "shipping address", "Lahore", 0),
        userListTile(context, "joined date", "date", 0),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: userTitle(context, "User settings"),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        ListTileSwitch(
          value: _value,
          leading: FaIcon(FontAwesomeIcons.moon),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: Colors.indigo,
          title: Text("Dark theme"),
        ),
        userListTile(context, "Log out", " ", 4),
      ],
    ));
  }

  //.........................................................................................
  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      BuildContext context, String title, String subTitle, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }

  Widget userTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
