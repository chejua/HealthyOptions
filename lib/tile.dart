import 'package:flutter/material.dart';
import 'classes/menu.dart';

class BeerTile extends AnimatedWidget {
  BeerTile({
    Key key,
    Animation<double> animation,
    this.beer,
    this.onAction,
    this.isHeader: false,
    this.delay: 200,
  }):super(key: key, listenable: animation);

  final Beer beer;
  final VoidCallback onAction;
  final bool isHeader;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // double.infinity GGA
      height: _height, // _height GGA
      child: Stack(
        children: <Widget>[
          _makeInfo(context),
          _makeBeer(context),
        ],
      ),
    );
  }

  _makeBeer(BuildContext context){
    final Animation<double> animation = listenable;
    final double _width = MediaQuery.of(context).size.width;

    Tween<double> tween = Tween(begin: _width - 90, end: 0.0); // Tween(begin: _width - 90, end: 0.0);

    return new Positioned(
      top: isHeader ? 0.0 : 10.0,
      bottom: 0.0,
      right: isHeader ? 0.0 : tween.evaluate(animation),
      width: _width + 27.0, //_width 25.0
      child: Hero(
        tag: beer.image,
        child: new Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: (){
              if(!isHeader){
                onAction == null ? null : onAction();
              }
            },
            // this is the item details title, picture, etc
            child: Stack(
              children: <Widget>[
                new Positioned(
                  top: isHeader ? 0.0 : 10.0,
                  bottom: isHeader ? 0.0 : 10.0,
                  left: 10.0, //0.0 GGA
                  right: isHeader ? 0.0 : 20.0, // 20.0
                  child: new Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: beer.color,
                    child: Text(
                      beer.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.w300,
                        fontSize: 35.0,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      left: 15.0,
                      right: 65.0,
                    ),
                  ),
                ),
                new Positioned(
                  top: isHeader ? 45.0 : 0.0,
                  bottom: isHeader ? -20.0 : 0.0,
                  left: isHeader ? _width - 42 : _width - 63, // _width - 40 : _width - 62,
                  width: 70.0, //70 GGA 75
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(beer.asset),
                        fit: BoxFit.scaleDown,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makeInfo(BuildContext context) {
    debugPrint("isnide _makeifno");
    return isHeader ? Container() : Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 110.0, //110 GGA
      right: 20.0, //20 GGA
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            //padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 8.0),
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(beer.title, style: Theme.of(context).textTheme.headline.copyWith(color: beer.color),),
          ),
          Text(beer.size, style: Theme.of(context).textTheme.body1,),
          Text('From \$48.00', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            width: double.infinity,
            child: FlatButton(
              color: Colors.grey.shade300,
              onPressed: (){},
              child: Text('Order'),
            ),
          ),
        ],
      ),
    );
  }

  double get _height {
    if(isHeader) {
      return 275.0;
    } else {
      return 200.0;
    }
  }
}