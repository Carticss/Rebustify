import 'package:flutter/material.dart';
import 'package:spotity_clon_rebust_test/home/widgets/channel_card.dart';
import 'package:spotity_clon_rebust_test/home/widgets/podcast_card.dart';

import 'bloc/home_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var BLoC = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            //Top 10 column
            Column(
              children: [
                buildTopTen(),
                buildTerror(),
                buildComedy(),
                buildChannels(),
              ],
            ),
          ],
        ),
    );
  }

  Widget buildChannels() {
    return Column(
      children: [
        const Text(
            "Recommended Channels",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22, color: Colors.white)
        ),
        const SizedBox(height: 30),
        FutureBuilder(
          future: BLoC.getChannels(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
                children: snapshot.data.map<Widget>((data){
                  return ChannelCard(
                    id: data["id"],
                    coverPic: data["urls"]["logo_image"]["original"],
                    channelName: data["title"],
                    description: data["description"],
                  );
                }).toList(),
              );
            }else{
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
          }
        ),
      ],
    );
  }

  Column buildTopTen() {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35.0, left: 35.0),
                      child: Text(
                        "Top 10 Episodes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FutureBuilder(
                              future: BLoC.getTopTen(),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Row(
                                    children: snapshot.data.map<Widget>((data){
                                        return Row(
                                          children: [
                                            PodcastCard(
                                              id: data["id"],
                                              title: data["title"],
                                              highMp3: data["urls"]["high_mp3"],
                                              channelName: data["channel"]["title"],
                                              coverPic: data["channel"]["urls"]["logo_image"]["original"],
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        );
                                      }).toList(),
                                  );
                                }else{
                                  return const Center(
                                      child: CircularProgressIndicator()
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
  }

  Column buildComedy() {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35.0, left: 35.0),
                      child: Text(
                        "Laugh Yourself Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, color: Colors.white)
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FutureBuilder(
                              future: BLoC.getTaggedOnes("comedy"),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Row(
                                    children: snapshot.data.map<Widget>((data){
                                        return Row(
                                          children: [
                                            PodcastCard(
                                              id: data["id"],
                                              title: data["title"],
                                              highMp3: data["urls"]["high_mp3"],
                                              channelName: data["channel"]["title"],
                                              coverPic: data["channel"]["urls"]["logo_image"]["original"],
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        );
                                      }).toList(),
                                  );
                                }else{
                                  return const Center(
                                      child: CircularProgressIndicator()
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
  }

  Column buildTerror() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 35.0, left: 35.0),
          child: Text(
              "Terror Nights",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, color: Colors.white)
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FutureBuilder(
                  future: BLoC.getTaggedOnes("terror"),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Row(
                        children: snapshot.data.map<Widget>((data){
                          return Row(
                            children: [
                              PodcastCard(
                                id: data["id"],
                                title: data["title"],
                                highMp3: data["urls"]["high_mp3"],
                                channelName: data["channel"]["title"],
                                coverPic: data["channel"]["urls"]["logo_image"]["original"],
                              ),
                              SizedBox(width: 20),
                            ],
                          );
                        }).toList(),
                      );
                    }else{
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
