import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final String image;
  final String title;
  const IconMenu({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 80, height: 80,),
        const SizedBox(height: 10,),
        Text(title),
        const SizedBox(height: 10,),
      ],
    );
  }
}
