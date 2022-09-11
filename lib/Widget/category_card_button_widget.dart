import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/Foods/food_list_page.dart';

class CategoryCardButtonWidget extends StatelessWidget {
  final AssetImage backgroundImage;
  final AssetImage iconImage;
  final String text;
  const CategoryCardButtonWidget({
    Key? key,
    required this.backgroundImage,
    required this.iconImage,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                    child: Stack(alignment: Alignment.center, children: [
                      Ink.image(
                          image: backgroundImage,
                          width: double.infinity,
                          fit: BoxFit.cover),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                    image: iconImage,
                                    width: 40.0,
                                    color: Colors.white),
                                SizedBox(
                                    width: 250.0,
                                    child: Text(text,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.bold))),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    size: 28.0, color: Colors.white)
                              ]))
                    ]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodListPage(title: text)));
                    }))));
  }
}
