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
      print("Home-Repo fetchPodcasts Error \n");
      if (e.response != null) {
        print(e.message);
        print(e.response.data);
        print(e.response.headers);
      } else {
        print(e.message);
      }
    }
  }

  Future<Map<dynamic, dynamic>> fetchTagedPodcasts(String tag) async {
    try{
      Response response = await dio.get(
          "https://api.audioboom.com/tag/$tag/audio_clips"
      );
      return response.data;
    }on DioError catch (e) {
      print("Home-Repo fetchTagedPodcasts Error \n");
      if (e.response != null) {
        print(e.message);
        print(e.response.data);
        print(e.response.headers);
      } else {
        print(e.message);
      }
    }
  }

  Future<Map<dynamic, dynamic>> fetchChannels() async {
    try{
      Response response = await dio.get(
          "https://api.audioboom.com/channels/recommended"
      );
      return response.data;
    }on DioError catch (e) {
      print("Home-Repo fetchChannels Error \n");
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