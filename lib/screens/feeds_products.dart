import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

//import 'package:badges/badges.dart';
class FeedProducts extends StatefulWidget {
  FeedProducts({Key? key}) : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 290,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height * 0.3),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcc0TmCh_qqsle483TzEjfuEoxzpF3p_9hMQ&usqp=CAU",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                // bottom: 30,
                // top: 0,
                // right: 10,
                child: Badge(
                  toAnimate: true,
                  shape: BadgeShape.square,
                  badgeColor: Colors.pink,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8)),
                  badgeContent:
                      Text('New', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          //........................
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "\$ 158.99",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity: 276",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    // Material will take space as much as required for a child
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(18),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
