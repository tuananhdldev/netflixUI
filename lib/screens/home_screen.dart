import 'package:flutter/material.dart';
import 'package:netflixui/models/movie_model.dart';
import 'package:netflixui/screens/content_scroll.dart';
import 'package:netflixui/screens/detail_screen.dart';
import 'package:netflixui/screens/label_list_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.4) + 0.06).clamp(0.1, 1.0);

        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),

        );
      },
      child: GestureDetector(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailScreen(item: movies[index])));
       },
        child: Stack(
          children: [
           Center(
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
               decoration: BoxDecoration(
                 borderRadius:  BorderRadius.circular(10.0),
                 boxShadow: [
                   BoxShadow(
                     color:  Colors.black54,
                     offset: Offset(0.0,4.0),
                     blurRadius: 10.0
                   )
                 ]
               ),
               child: Center(
                 child: Hero(
                   tag: movies[index].imageUrl,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10.0),
                     child: Image(
                       image: AssetImage(movies[index].imageUrl),
                       height: 220,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
               ),
             ),
           ),
            Positioned(
                left: 30.0,
                bottom: 40.0,
                child: Container(
                  width: 250,
                  child: Text(movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/images/netflix_logo.png'),
          height: 50,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () {},
          iconSize: 30.0,
          color: Colors.black,
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          )
        ],

      ),
      body: ListView(
        children: [
          //pager header

          Container(
            color: Colors.white,
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
                controller: _pageController,
                itemCount: movies.length,
                itemBuilder: (context,index){
              return _movieSelector(index);
            }),
          ),
          //end pager header
      //categories label
       LabelsList(),
          ContentScroll(images: myList, title: 'My List', imageHeight: 250, imageWidth: 150),
          ContentScroll(images: popular, title: 'Popular', imageHeight: 250, imageWidth: 150),

          //end categories label
        ],
      ),
    );
  }
}
