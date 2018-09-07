import 'dart:ui';

class Beer {

  final int id;
  final String title;
  final String word;
  final double rating;
  final double alcohol;
  final String size;
  final String note;
  final String foodMatch;
  final String image;
  final Color color;

  Beer(
      {this.id,
        this.title,
        this.word,
        this.rating,
        this.size,
        this.foodMatch,
        this.note,
        this.image,
        this.alcohol,
        this.color});

  String get asset => 'images/beers/$image.png';
  bool get isDark => color.computeLuminance() < 0.6;
}
