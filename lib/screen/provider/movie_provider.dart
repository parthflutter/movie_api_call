import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ulitis/movie_helper.dart';
import '../modal/Movie_modal.dart';



class Movie_provider extends ChangeNotifier {
  ApiHelper ah = ApiHelper();

  Future<MovieModal> Getapi() async {
    MovieModal m1 = await ah.GetApiCall();
    return m1;
  }

  Future<void> permission() async {
    var Status = await[
      Permission.camera,
      Permission.location,
      Permission.storage,
    ].request();
  }
}
