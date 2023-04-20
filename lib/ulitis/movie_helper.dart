import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/modal/Movie_modal.dart';


class ApiHelper{

  Future<MovieModal> GetApiCall() async {
    String getLink = "https://imdb8.p.rapidapi.com/auto-complete?q=game%20of%20thr ";
    Uri uri = Uri.parse(getLink);
    var response = await http.get(uri,headers: {"X-RapidAPI-Key" : "ee60643964msh4622b22a5b81716p1fc2e2jsn3ed0bcf1ef08"});
    var json = jsonDecode(response.body);
    MovieModal movieModal = MovieModal.fromJson(json);
    return movieModal;
  }
}