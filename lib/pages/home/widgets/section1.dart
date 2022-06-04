import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/colors.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        Text('Ingin Menggalang Dana ? ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 16,),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(CustomColors.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
              )
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Galang Dana Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
            ),
          ),
        ),
        SizedBox(height: 16,),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: CustomColors.primary)
                  )
              )
          ),
          child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/comment.svg', height: 20, width: 20, color: CustomColors.primary),
                    Text('Tanya Tentang Galang Dana', style: TextStyle(color: CustomColors.primary, fontWeight: FontWeight.bold, fontSize: 16),),
                  ],
                )
            ),
          ),
        ),
        SizedBox(height: 16,),

      ],
    );
  }
}
