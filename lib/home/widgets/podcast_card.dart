import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> savePreferences(String title, String channelName, String podPic, String highMp3) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("title", title);
  prefs.setString("channelName", channelName);
  prefs.setString("podPic", podPic);
  prefs.setString("highMp3", highMp3);
}

class PodcastCard extends StatefulWidget {
  int id;
  String highMp3;
  String coverPic;
  String title;
  String channelName;
  PodcastCard({
    Key key,
    this.id,
    this.highMp3,
    this.coverPic,
    this.channelName,
    this.title
  }) : super(key: key);

  @override
  State<PodcastCard> createState() => _PodcastCardState();
}

class _PodcastCardState extends State<PodcastCard> {
  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() {
    return GestureDetector(
      onTap: (){
        savePreferences(
            widget.title,
            widget.channelName,
            widget.coverPic,
            widget.highMp3
        );
        Navigator.pushNamed(context, "/player");
      },
      child: Container(
        width: 150,
        height: 300,
        child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
                image: NetworkImage(
                    widget.coverPic
                )
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
          SizedBox(height: 7),
          Text(
              widget.channelName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
          ),
        ],
  ),
      ),
    );
  }
}


