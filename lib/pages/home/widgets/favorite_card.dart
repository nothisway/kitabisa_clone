import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/colors.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({Key? key,
  required this.image,
  required this.title,
  required this.name,
  required this.amount,
  required this.dayRemain,
  }) : super(key: key);

  final String image;
  final String title;
  final String name;
  final String amount;
  final String dayRemain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                width: 250,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 155,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 2,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text(name, style: TextStyle(fontSize: 10, color: Colors.black),),
                        SizedBox(width: 10,),
                        SvgPicture.asset(
                          'assets/icons/icon__verified-org.svg', width: 20, height: 10,)
                      ],
                    ),
                    SizedBox(height: 15,),
                    LinearProgressIndicator(
                      value: 0.2,
                      backgroundColor: Colors.grey[100],
                      valueColor:
                      AlwaysStoppedAnimation<Color>(
                          CustomColors.primary),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Terkumpul', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text('Sisa Hari', style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(amount, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(dayRemain, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Divider(
          height: 1,
          color: Colors.grey,
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
