import 'package:flutter/material.dart';

class PodcastCard extends StatefulWidget {
  String coverPic;
  String title;
  String channelName;
  PodcastCard({
    Key key,
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
    return Container(
      width: 150,
      height: 300,
      child: Column(
      children: [
        Image(
            image: NetworkImage(
                widget.coverPic
            )
        ),
        SizedBox(height: 10),
        Text(
          widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, color: Colors.white)
        ),
        SizedBox(height: 7),
        Text(
            widget.channelName,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, color: Colors.grey)
        ),
      ],
  ),
    );
  }
}


