import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/model_movie.dart';
import 'package:flutter_netflix_clone/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final dynamic movies;
  const CarouselImage({this.movies});
  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  late final int _currentPage = 0;
  late String _currentKeyword;
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/${m.poster}')).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.all(20)),
          CarouselSlider(
            items: images,
            options: CarouselOptions(height: 150.0, autoPlay: false),
            // onPageChanged: (index) {
            //   setState(() {
            //     _currentPage = index;
            //     _currentKeyword = keywords[_currentPage];
            //   });
            // }
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
              child: Text(
                _currentKeyword,
                style: const TextStyle(fontSize: 11),
              )),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                      const Text('?????? ?????? ?????????', style: TextStyle(fontSize: 11))
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: FlatButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.play_arrow, color: Colors.black),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              '??????',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) {
                                  return DetailScreen(
                                      movie: movies[_currentPage]);
                                }));
                          },
                        ),
                        const Text(
                          '??????',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes, _currentPage),
          ))
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i
              ? const Color.fromRGBO(255, 255, 255, 0.9)
              : const Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }
  return results;
}
