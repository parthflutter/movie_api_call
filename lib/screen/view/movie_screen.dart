import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Movie_modal.dart';
import '../provider/movie_provider.dart';

class Movie_screen extends StatefulWidget {
  const Movie_screen({Key? key}) : super(key: key);

  @override
  State<Movie_screen> createState() => _Movie_screenState();
}

class _Movie_screenState extends State<Movie_screen> {
  Movie_provider? T;
  Movie_provider? F;
  @override
  void initState() {
    super.initState();
    Provider.of<Movie_provider>(context, listen: false).permission();
  }
  @override
  Widget build(BuildContext context) {
    T = Provider.of<Movie_provider>(context, listen: true);
    F = Provider.of<Movie_provider>(context, listen: false);
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          title: Text("Movies",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          centerTitle: true,
        ),
        body: Column(
          children: [
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  MovieModal  moviedata = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: moviedata.d.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            leading: Container(
                              height:100,width:100,child: moviedata.d[index].i != null ? Image.network( "${moviedata.d[index].i!.imageUrl}") : Text("Not Available"),),
                            subtitle: Text(
                              "${moviedata.d[index].rank}",
                              style: TextStyle(color: Colors.grey.shade400),),
                            title: Text(
                              "${moviedata.d[index].l}", style: TextStyle(color: Colors.white),),
                            trailing: Text(
                              "${moviedata.d[index].id}", style: TextStyle(color: Colors.white),),
                        )
                          );
                      },
                    ),
                  );
                }
                return Container(
                  child: CircularProgressIndicator(),
                );
              },
              future: F!.Getapi(),
            ),

          ],
        ),
      ),
    );
  }
}

