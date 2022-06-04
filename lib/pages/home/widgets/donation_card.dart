import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({Key? key, required this.title, required this.image, required this.amount, required this.progress, required this.remainDate}) : super(key: key);

  final String image;
  final String title;
  final double progress;
  final String amount;
  final String remainDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        elevation: 3,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(child:  ClipRRect(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
               child: Image.asset(image,
                 width: double.infinity,
                 fit: BoxFit.fill,))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  title),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[100],
                valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(amount),
                  Text(remainDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
