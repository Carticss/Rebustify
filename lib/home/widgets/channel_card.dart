import 'package:flutter/material.dart';

class ChannelCard extends StatefulWidget {
  int id;
  String coverPic;
  String description;
  String channelName;
  ChannelCard({
    Key key,
    this.id,
    this.coverPic,
    this.channelName,
    this.description
  }) : super(key: key);

  @override
  State<ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<ChannelCard> {
  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() {
    return Container(
      width: 350,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
                width: 250,
                height: 250,
                image: NetworkImage(
                    widget.coverPic
                )
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.channelName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, color: Colors.white),
            maxLines: 4,
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
                widget.description,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12, color: Colors.grey)
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}


