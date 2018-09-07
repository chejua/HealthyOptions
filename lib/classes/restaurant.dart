import 'menu.dart';
abstract class Restaurant {

  String _name;
  String _phrase;
  String _imageName;
  List<Beer> _beers;
  Map _menu;
  
  Restaurant(name, phrase, imageName) {
    _name = name;
    _phrase = phrase;
    _imageName = imageName;
    _menu = buildMenu();
    _beers = buildBeers();
  }

  //Restaurant.init(this._name, this._phrase, this._imageName);

  Map buildMenu();
  List<Beer> buildBeers();
  
  String get getName => _name;
  String get getPhrase => _phrase;
  String get getImageName => _imageName;

  Map get getMenu => _menu;
  set menu(Map menu) => _menu;

  List<Beer> get getBeers => _beers;

  set beers(Beer value) {
    _beers.add(value);
  }
}