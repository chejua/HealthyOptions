import 'package:restaurant_food/classes/menu.dart';
import 'package:restaurant_food/classes/restaurant.dart';

class SteaknShake extends Restaurant {
  SteaknShake(String name, String phrase, String imageName) : super(name, phrase, imageName);

  Map buildMenu() {
    // TODO: implement buildMenu
    var menu = new Map() ;
    menu["item1"] = 1;

    return menu;
  }

  @override
  List<Beer> buildBeers() {
    // TODO: implement buildBeers
  }



}