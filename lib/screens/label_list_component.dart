import 'package:flutter/material.dart';
import 'package:netflixui/models/movie_model.dart';

class LabelsList extends StatelessWidget {
  const LabelsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 80.0,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30),
          scrollDirection: Axis.horizontal,
          itemCount: labels.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffd45253),
                        Color(0xff9e1f28)
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff9e1f28),
                        offset: Offset(0.0,2.0),
                        blurRadius: 6.0
                    )
                  ]

              ),
              child: Center(
                child: Text(labels[index].toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8
                  ),

                ),
              ),
            );
          }),
    );
  }
}
