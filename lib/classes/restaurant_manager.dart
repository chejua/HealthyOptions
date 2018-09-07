import 'package:restaurant_food/classes/restaurant.dart';
import 'dennys.dart';
import 'mc_donalds.dart';
import 'steaknshake.dart';
import 'wendys.dart';

class RestaurantManager {

  var _restaurants = new List<Restaurant>();

  List<Restaurant> get restaurants => _restaurants;

  RestaurantManager() {
    _restaurants.add(new Dennys("Denny's", "Pankakes", "images/dennysother.jpg"));
    _restaurants.add(new McDonalds("Mc Donalds", "Burgers", "images/mcdonalds.png"));
//    _restaurants.add(new SteaknShake("Steak 'n Shake", "Shakes", "images/steakandshake.png"));
    _restaurants.add(new Wendys("Wendy's", "Burgers Square", "images/wendys.jpg"));
  }


}