import 'package:flutter/material.dart';
import 'package:memes/models/girls_memes.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

class Person_Details extends StatefulWidget {
  Person_Details({this.person_details});
  final Girlsmeme person_details;
  @override
  _Person_DetailsState createState() => _Person_DetailsState();
}

class _Person_DetailsState extends State<Person_Details> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinchZoomImage(
        image: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image(image: NetworkImage(widget.person_details.url),)
        ),
      ),
    );
  }
}
