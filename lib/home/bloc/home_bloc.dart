import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spotity_clon_rebust_test/home/repository/home_repository.dart';

var podcsController = HomeRepo();

class HomeBloc {

  Future<List<Map<dynamic, dynamic>>> getTopTen() async {
    final List<Map<dynamic, dynamic>> podcasts = [];
    Map<dynamic, dynamic> response = await podcsController.fetchPodcasts();
    for (int i = 0; i < 10; i++){
      podcasts.add(response["body"]["audio_clips"][i]);
    }
    return podcasts;
  }

}