import 'package:flutter/material.dart';
import 'package:netflixui/models/movie_model.dart';
import 'package:netflixui/screens/circular_clipper.dart';
import 'package:netflixui/screens/content_scroll.dart';

class DetailScreen extends StatelessWidget {
  final Movie item;
DetailScreen({required item}): item = item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //header
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  child: Hero(
                    tag: item.imageUrl,
                    child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20.0),
                      child: Image(
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(item.imageUrl),
                      ),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      padding: EdgeInsets.only(left: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Image(
                    image: AssetImage('assets/images/netflix_logo.png'),
                    height: 60.0,
                    width: 150,
                  ),
                  IconButton(
                      padding: EdgeInsets.only(right: 30.0),
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border))
                ],
              ),
              Positioned.fill(
                  bottom: 10.0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(10.0),
                      elevation: 12.0,
                      onPressed: () {},
                      shape: CircleBorder(),
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow,
                        size: 60,
                        color: Colors.red,
                      ),
                    ),
                  ))
            ],
          ),
          //end header
          //body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,

                ),
                SizedBox(height: 10.0,),
                Text(
                  item.categories,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0,),
                Text('⭐ ⭐ ⭐ ⭐ ⭐', style: TextStyle(fontSize: 25.0
                ),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Year', style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0
                        ),),
                        Text(item.year.toString(), style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                            ,fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                    Column(
                      children: [
                        Text('Country', style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                        ),),
                        Text(item.country.toString(), style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                            ,fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                    Column(
                      children: [
                        Text('Length', style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                        ),),
                        Text('${item.length} min', style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                            ,fontWeight: FontWeight.bold
                        ),),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 25.0,),
                Container(
                  height: 120,
                    child: SingleChildScrollView(
                      child: Text(
                        item.description,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                )
              ],
            ),
          ),
          //end body
          ContentScroll(images: item.screenshots, title: 'Screenshots', imageHeight: 200, imageWidth: 250),

        ],
      ),
    );
  }
}
