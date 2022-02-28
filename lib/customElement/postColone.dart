import 'package:flutter/material.dart';

class MyPostColone extends StatefulWidget {
  MyPostColone({Key? key}) : super(key: key);

  final List postItems = [
    {
      "pseudo": 'painStop',
      "photo": "assets/images/photo/photo-1.jpeg",
      "photoProfil": "assets/images/profil/photo-1.webp",
      "description": "🤩😱 Loock amazing, what do you like to see ?"
    },
    {
      "pseudo": 'sonTomato',
      "photo": "assets/images/photo/photo-2.jpeg",
      "photoProfil": "assets/images/profil/photo-2.jpeg",
      "description": "😎🤠🛫 New travel!!! New York & Chicago, We re coming!"
    },
    {
      "pseudo": 'painStop',
      "photo": "assets/images/photo/photo-3.jpeg",
      "photoProfil": "assets/images/profil/photo-3.jpeg",
      "description": "He slid back into his former position"
    },
  ];

  @override
  _MyPostColoneState createState() => _MyPostColoneState();
}

class _MyPostColoneState extends State<MyPostColone> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.postItems.map(
      (post) {
        return Column(
          children: [
            const Divider(
              thickness: 1.8,
            ),
            //head post
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(post["photoProfil"]),
                  ),
                ),
                Text(
                  post["pseudo"],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz)
              ],
            ),
            const Divider(
              thickness: 1.8,
            ),
            //image post
          ],
        );
      },
    ).toList());
  }
}
