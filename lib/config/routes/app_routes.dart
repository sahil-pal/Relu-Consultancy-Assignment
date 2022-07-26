import 'package:flutter/material.dart';
import 'package:music_app/config/constants/app_constants.dart';
import 'package:music_app/screens/lyrics.dart';

Map<String,WidgetBuilder> getRoutes(){
  return {
    RouteConstants.SONG_LYRICS : (context) => const SongLyricsScreen()
  };
}