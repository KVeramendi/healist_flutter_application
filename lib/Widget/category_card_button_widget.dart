import 'package:flutter/material.dart';
import 'package:healist_flutter_application/View/Menu/Foods/food_list_page.dart';

class CategoryCardButtonWidget extends StatelessWidget {
  final AssetImage backgroundImage;
  final AssetImage iconImage;
  final String text;
  const CategoryCardButtonWidget(
      {Key? key,
      required this.backgroundImage,
      required this.iconImage,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                    child: Stack(alignment: Alignment.center, children: [
                      Ink.image(
                          image: backgroundImage,
                          fit: BoxFit.cover,
                          width: double.infinity),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                    image: iconImage,
                                    width: 32.0,
                                    color: Colors.white),
                                SizedBox(
                                    width: 280.0,
                                    child: Text(text,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)),
                                const Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.white)
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
