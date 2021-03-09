import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes/models/girls_memes.dart';
import 'package:memes/person_details.dart';
import 'networks/base_networks.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  List<Girlsmeme> memesdata = List();
  void getHttp() async {
    setState(() {
    });
    try {
      Response response =
      await dioClient.ref.get("https://namo-memes.herokuapp.com/memes/page/0/30");
      setState(() {
        memesdata = girlsmemeFromJson(jsonEncode(response.data));
        print(response);
      });
    } catch (e) {
      setState(() {
      });
      print(e);
    }
  }
  @override
  void initState() {
    getHttp();
    super.initState();

  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text("Meme",style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.deepPurple,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
              child:SingleChildScrollView(
                child: Column(
                  children: [

                    GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: memesdata.length,
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,crossAxisSpacing:7, mainAxisSpacing: 7),
                        itemBuilder: (context, index) {
                          Girlsmeme memes=memesdata[index] ;
                          return Memes(
                              images: memes.url,
                            person_details: memes,

                          );
                        }
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
class Memes extends StatefulWidget {
  Memes({  this.images,this.person_details});

  final String images;
  final Girlsmeme person_details;
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Memes> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Person_Details(person_details: widget.person_details,
            ),
          ),
        );
      },
      child: Container(
        height: 20,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
           // image: DecorationImage(
             //   image: NetworkImage(widget.images),fit: BoxFit.cover
            //),
          ),
        child: CachedNetworkImage(
          imageUrl: widget.images,fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

      ),
    );
  }
}