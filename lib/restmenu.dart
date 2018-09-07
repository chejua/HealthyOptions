import 'dart:async';
import 'package:flutter/material.dart';
import 'classes/restaurant.dart';
import 'classes/menu.dart';
import 'tile.dart';
import 'detail.dart';

//class MenuRestaurant extends StatelessWidget {
//  final Restaurant restaurant;
//
//  //Restaurant res = new Restaurant.init("", "", "");
//  MenuRestaurant({Key key, @required this.restaurant}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    var menu = restaurant.getMenu;
//
//    print("The menu length is ${menu.length}");
//
//    //menu.forEach((k, v) => debugPrint("$k : $v"));
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('${restaurant.getName}'),
//        backgroundColor: Colors.red,
//      ),
//      body: new Container(
//        alignment: Alignment.topCenter,
//        child: new Image.asset(
//          'images/umbrella.png',
//          width: 200.0,
//          height: 200.0,
//        ),
//      ),
//    );
//  }
//}


class BeersMenuMain extends StatefulWidget {
  //BeersMenuMain({Key key}) : super(key: key);
  final Restaurant restaurant;
  BeersMenuMain({Key key, @required this.restaurant}) : super(key: key);

  @override
  _BeersMenuState createState() => new _BeersMenuState();
}

class _BeersMenuState extends State<BeersMenuMain> with TickerProviderStateMixin {
  Map<int, AnimationController> controllerMaps = new Map();
  Map<int, CurvedAnimation> animationMaps = new Map();
  List<Beer> beers;

  @override
  void initState() {

    beers = widget.restaurant.getBeers;

    beers.forEach((Beer beer){
      AnimationController _controller = AnimationController(duration: Duration(milliseconds: 400), vsync: this,);
      CurvedAnimation _animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);

      controllerMaps[beer.id] = _controller;
      _controller.addStatusListener((AnimationStatus status){
        if(status == AnimationStatus.completed){
          _handleHero(beer);
        }
      });
      animationMaps[beer.id] = _animation;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.grey.shade200,
      ),
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Food', style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.shade500
          ),),
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            Beer beer = beers[index];
            AnimationController _controller = controllerMaps[beer.id];
            CurvedAnimation _animation = animationMaps[beer.id];
            return BeerTile(
              beer: beer,
              isHeader: false,
              animation: _animation,
              onAction: (){
                _controller.forward();
              },
            );
          },
          itemCount: beers.length,
        ),
      ),
    );
  }

  void _handleHero(Beer beer) {
    AnimationController _controller = controllerMaps[beer.id];
    CurvedAnimation _animation = animationMaps[beer.id];
    Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return BeerDetail(
            beer: beer,
            animation: _animation,
            onAction: (){
              Navigator.pop(context);
            },
          );
        }, fullscreenDialog: true)
    ).then((value){
      Future.delayed(Duration(milliseconds: 600)).then((v){
        _controller.reverse();
      });
    });
  }
}


