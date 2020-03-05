
import 'package:flutter/foundation.dart';

class Book {
  final String id;
  final String title;
  final String authorName;
  final String imageUrl;

   Book(
      {@required this.id,
        @required this.title,
        @required this.authorName,
        @required this.imageUrl,
      });
}
