import 'package:flutter/material.dart';
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
                                            title: data["title"],
                                            channelName: data["channel"]["title"],
                                            coverPic: data["channel"]["urls"]["logo_image"]["original"],
                                          ),
                                          SizedBox(width: 20),
                                        ],
                                      );
                                    }).toList(),
                                );
                              }else{
                                return CircularProgressIndicator();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
    );
  }
}
