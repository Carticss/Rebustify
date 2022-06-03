import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<String> getTitle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("title");
}

Future<String> getChannelName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("channelName");
}

Future<String> getPodPic() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("podPic");
}

Future<String> getMp3() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("highMp3");
}

class Player extends StatefulWidget {
  const Player({Key key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  bool isPlaying = false;

  AudioPlayer _player;

  Duration position = Duration();
  Duration musicLength = Duration();

  Widget slider(){
    return Slider(
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value){
          seekToSec(value.toInt());
        }
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.durationHandler = (d){
      setState(() {
        musicLength = d;
      });
    };

    _player.positionHandler = (p){
      setState(() {
        position = p;
      });
    };

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: (){
                          Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 80),
                    const Center(
                      child: Text(
                          "Redustify",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, color: Colors.white)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FutureBuilder(
                      future: getPodPic(),
                      builder: (context, snapshot) {
                        return Image(
                            width: 250,
                            height: 250,
                            image: NetworkImage(
                                snapshot.data
                            )
                        );
                      }
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: FutureBuilder(
                    future: getTitle(),
                    builder: (context, snapshot) {
                      return Text(
                          snapshot.data,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18, color: Colors.white)
                      );
                    }
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: FutureBuilder(
                    future: getChannelName(),
                    builder: (context, snapshot) {
                      return Text(
                          snapshot.data,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12, color: Colors.grey)
                      );
                    }
                  ),
                ),
                SizedBox(height: 60),
                slider(),
                SizedBox(height: 30),
                Center(
                  child: isPlaying ?
                  IconButton(
                    iconSize: 50,
                    onPressed: () async {
                      String mp3 = await getMp3();
                      _player.play(mp3);
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: const Icon(
                      Icons.play_circle_fill_sharp,
                      color: Colors.teal,
                    ),
                  )
                  : IconButton(
                    iconSize: 50,
                    onPressed: (){
                      _player.pause();
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: const Icon(
                      Icons.pause_circle_filled_sharp,
                      color: Colors.teal,
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}