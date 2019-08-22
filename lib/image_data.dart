import 'package:flutter/foundation.dart';

class ImageData {
  final String author;
  String title;
  String filename;

  ImageData._(
      {@required this.author, @required this.title, @required this.filename});

  factory ImageData.fromJson(Map<String, Object> jsonObj) {
    return ImageData._(
        author: jsonObj['author'],
        title: jsonObj['title'],
        filename: jsonObj['file']);
  }
}
