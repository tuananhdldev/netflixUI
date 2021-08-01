import 'package:flutter/material.dart';

class ContentScroll extends StatelessWidget {

  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
      required this.images,
      required this.title,
      required this.imageHeight,
      required this.imageWidth
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)
        ,child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: Theme.of(context).textTheme.headline6,),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward, size: 30,))
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context,index){
             return Container(
               margin: EdgeInsets.symmetric(horizontal: 10.0,
               vertical: 20.0
               ),
               width: imageWidth,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black54,
                     offset: Offset(0.0,4.0),
                     blurRadius: 6.0
                   )
                 ]
               ),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(10.0),
                 child: Image(
                   image: AssetImage(images[index]),
                   fit: BoxFit.cover,
                 ),
               ),
             );
          }),
        )


      ],
    );
  }
}
