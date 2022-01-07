import 'package:flutter/material.dart';
import 'package:shopping_app/widget/feeds_products.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 10,
              childAspectRatio: 240 / 290,
            ),
            itemBuilder: (context, int index) {
              return FeedProducts();
            }),
     

      //     StaggeredGridView.countBuilder(
      //   crossAxisCount: 4,
      //   itemCount: 8,
      //   mainAxisSpacing: 4.0,
      //   crossAxisSpacing: 4.0,
      //   itemBuilder: (BuildContext context, int index) => FeedProducts(),
      //   staggeredTileBuilder: (int index) =>
      //       StaggeredTile.count(2, index.isEven ? 2 : 1),
      // )
       ),
    );
  }
}
