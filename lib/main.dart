import 'package:flutter/material.dart';
import 'package:movie_api_call/screen/provider/movie_provider.dart';
import 'package:movie_api_call/screen/view/movie_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Movie_provider(),)
  ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Movie_screen(),
      },
    ),
  ),
  );
}