import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../const/colors.dart';

class PilihanKitaBisaCard extends StatelessWidget {
  const PilihanKitaBisaCard({Key? key, required this.title, required this.image, required this.amount, required this.progress, required this.remainDate}) : super(key: key);

  final String image;
  final String title;
  final double progress;
  final String amount;
  final String remainDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
            Padding(padding: EdgeInsets.only(left: 8, right: 4, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: Text('Aksi cepat tanggap korban bencana', style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 10),)),
                Expanded(flex: 0, child: SvgPicture.asset('assets/icons/icon__verified-org.svg', width: 10, height: 10,))
              ],
            ),),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0, bottom: 15),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[100],
                valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('Terkumpul', style: TextStyle(fontSize: 10),)
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(amount, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );

  }
}
