import 'package:flutter/material.dart';
import 'dart:async';
import 'package:restaurant_food/classes/restaurant_manager.dart';
import 'package:restaurant_food/classes/restaurant.dart';
import 'package:restaurant_food/restmenu.dart';

class RestSelector extends StatefulWidget {
  @override
  _RestSelectorState createState() => _RestSelectorState();
}

class _RestSelectorState extends State<RestSelector> {

  var _restaurantManager = new RestaurantManager();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Restaurants"),
      ),
      body: new ListView.builder(
        itemCount: _restaurantManager.restaurants.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return new Divider();

          final index = position ~/ 2;

          return _buildRow(index);
        },
      ),
    );
  }

  Widget _buildRow(int i) {
    return new Padding(padding: const EdgeInsets.all(16.0),
        child: new ListTile(
          title: new Text(
            "${_restaurantManager.restaurants[i].getName}",
            style: new TextStyle(
              color: Colors.orange,
              fontSize: 15.0,
            ),
          ),
          subtitle: new Text(
            "${_restaurantManager.restaurants[i].getPhrase}",
          ),
          leading: new CircleAvatar(
              backgroundImage: AssetImage('${_restaurantManager.restaurants[i].getImageName}')
          ),
          onTap: () {
            _pushRestaurant(_restaurantManager.restaurants[i]);
          },
        )
    );
  }

  Future _pushRestaurant(Restaurant res) async {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
    return new BeersMenuMain(restaurant: res);
  }));

//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) =>
//                MenuRestaurant(
//                  restaurant: "${_restaurants[position].getName}",
//                )));
  }
}



//Future _goToNextScreen(BuildContext context) async {
//  Map results = await Navigator
//      .of(context)
//      .push(new MaterialPageRoute(builder: (BuildContext context) {
//    return new MenuRestaurant();
//  }));
//}


