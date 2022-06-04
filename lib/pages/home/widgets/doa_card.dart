import 'package:flutter/material.dart';

class DoaCard extends StatelessWidget {
  const DoaCard({Key? key,
    required this.name,
    required this.bio,
    required this.ago,
    required this.pray,
    required this.aminCount,
  }) : super(key: key);

  final String name;
  final String bio;
  final String ago;
  final String pray;
  final String aminCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.more_horiz),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person, color: Colors.grey,),
          ),
          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 3, child: Text(bio, style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 10),)),
              Expanded(flex: 0, child: Text(' • $ago yang lalu', style: TextStyle(fontSize: 10),))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(pray,
          maxLines: 4,
          style: TextStyle(overflow: TextOverflow.visible),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '$aminCount Orang ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  children: const <TextSpan>[
                    TextSpan(text: 'mengaminkan doa ini', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 15, color: Colors.grey,),
                      Text(' Aamiin', style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(22/7),
                        child: Icon(Icons.reply_outlined, size: 15, color: Colors.grey,),
                      ),
                      Text(' Bagikan', style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
