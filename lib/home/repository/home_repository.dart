import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepo{

  var dio = Dio();

  Future<Map<dynamic, dynamic>> fetchPodcasts() async {
    try{
      Response response = await dio.get(
        "https://api.audioboom.com/audio_clips/popular"
      );
      return response.data;
    }on DioError catch (e) {
      print("Home-Repo Error \n");
      if (e.response != null) {
        print(e.message);
        print(e.response.data);
        print(e.response.headers);
      } else {
        print(e.message);
      }
    }
  }

}