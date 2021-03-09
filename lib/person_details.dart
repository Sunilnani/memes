import 'package:flutter/material.dart';
import 'package:memes/models/girls_memes.dart';

class Person_Details extends StatefulWidget {
  Person_Details({this.person_details});
  final Girlsmeme person_details;
  @override
  _Person_DetailsState createState() => _Person_DetailsState();
}

class _Person_DetailsState extends State<Person_Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          image: DecorationImage(
              image: widget.person_details.url !=null? NetworkImage(widget.person_details.url):Image.asset("img/modi.jpg"),fit: BoxFit.contain
          ),
        )
    );
  }
}
