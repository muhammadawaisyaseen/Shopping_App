import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  List<Map<String, Object>> categories = [
    // - assets/images/style.jpg
    // - assets/images/laptops.jpg
    // - assets/images/phones.jpg
    // - assets/images/clothes.jpg
    // - assets/images/shoes.jpg

    {
      'categoryName': 'Stylish',
      'categoryImagesPath': 'assets/images/style.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/laptops.jpg',
    },
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/phones.jpg',
    },
    {
      'categoryName': 'Cloths',
      'categoryImagesPath': 'assets/images/clothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/shoes.jpg',
    },
    // {
    //   'categoryName': 'Phones',
    //   'categoryImagesPath': 'assets/images/samsung.jpg',
    // },
    // {
    //   'categoryName': 'Phones',
    //   'categoryImagesPath': 'assets/images/samsung.jpg',
    // },
    // {
    //   'categoryName': 'Laptops',
    //   'categoryImagesPath': 'assets/images/samsung.jpg',
    // },
    // {
    //   'categoryName': 'Laptops',
    //   'categoryImagesPath': 'assets/images/samsung.jpg',
    // },
    // {
    //   'categoryName': 'Laptops',
    //   'categoryImagesPath': 'assets/images/samsung.jpg',
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage(
                      categories[index]['categoryImagesPath'].toString()))),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              color: Theme.of(context).backgroundColor,
              child: Text(
                categories[index]['categoryName'].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Theme.of(context).textSelectionColor),
              ),
            ))
      ],
    );
  }
}
