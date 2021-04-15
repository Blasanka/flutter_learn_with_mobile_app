import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UniversalNetworkImage extends StatelessWidget {

  final String? imageUrl;

  UniversalNetworkImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child:FadeInImage(
        image: CachedNetworkImageProvider(
          imageUrl ?? "http://via.placeholder.com/350x150",
        ),
        placeholder: AssetImage("assets/images/blur-image.png"),
        imageErrorBuilder: (context, url, error) => new Icon(Icons.error),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      ),
    );
  }
}
