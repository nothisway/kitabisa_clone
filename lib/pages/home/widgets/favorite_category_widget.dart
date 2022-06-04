import 'package:flutter/material.dart';

class FavoriteCategoryWidget extends StatelessWidget {
  const FavoriteCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Image.asset('assets/icons/icon-bencana.png', width: 20, height: 20,),
            ),
            SizedBox(height: 10,),
            Text('Bencana Alam', style: TextStyle(color: Colors.grey, fontSize: 10),)
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Image.asset('assets/icons/icon-balita.png', width: 20, height: 20,),
            ),
            SizedBox(height: 10,),
            Text('Balita & Anak Sakit', style: TextStyle(color: Colors.grey, fontSize: 10),)
          ],
        ),
        Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                child: Image.asset('assets/icons/icon-medis.png', width: 20, height: 20,),
              ),
              SizedBox(height: 10,),
              Text('Bantuan Medis & Kesehatan', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center,)
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Image.asset('assets/icons/icon-list.png', width: 20, height: 20,),
            ),
            SizedBox(height: 10,),
            Text('Lainnya', style: TextStyle(color: Colors.grey, fontSize: 10),)
          ],
        )
      ],
    );

  }
}
