import 'package:flutter/material.dart';
import 'package:memes/memes.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.cancel,size: 45,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => Memes(),
                ),
              );
            }),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: PinchZoomImage(
            image: ClipRRect(
              child: Image(image: NetworkImage(widget.person_details.url),)
            ),
          ),
        ),
      ),
    );
  }
}
