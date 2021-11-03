import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/src/utils/utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentIndex = 0;
  List imgs = [];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/img.json").then((s) {
      setState(() {
        imgs = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
      color: Color(0xFFC5E5F3),
      child: Stack(
        children: [
          Positioned(
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new)),
              top: 50,
              left: 10),
          Positioned(
              top: 120,
              left: 0,
              height: 100,
              width: width,
              child: header(width)),
          Positioned(
            top: 320,
            left: 0,
            child: Container(width: width, height: height, color: Color(0Xfff9fbfc))),
          Positioned(
            child: box(width),
            top: 250,
            left: 0,
            width: width,
            height: 250,
          ),
          Positioned(
            top: 540,
            left: 25,
            height: 50,
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: "Total participants ",
                  style: Utils().createTextStyle(20, weight: FontWeight.w700, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "(11)",
                      style: Utils().createTextStyle(14, color: Color(0xfffbc33e))
                    )
                  ]
                )
              )
            ),
          ),
          // show images
          images(),
          favourites()
        ],
      ),
    ));
  }

  Widget header(double width) => Container(
      width: width,
      height: 100,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFFebf8fd)),
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(children: [
            CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(Get.arguments['img'])),
            SizedBox(width: 10),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Get.arguments['name'],
                      style: TextStyle(
                          color: Color(0XFF3b3f42),
                          fontSize: 18,
                          decoration: TextDecoration.none)),
                  SizedBox(height: 5),
                  Text("Top Level",
                      style: TextStyle(
                          color: Color(0xFFadecb7),
                          fontSize: 18,
                          decoration: TextDecoration.none))
                ]),
            Expanded(child: Container()),
            Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFf3fafc)),
                child: Center(
                    child: Icon(Icons.notifications,
                        color: Color(0xFF69c5df), size: 30)))
          ])));

  Widget box(double width) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      width: width,
      height: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfffcfffe),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                spreadRadius: 1,
                offset: Offset(0, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(Get.arguments['title'],
                        style: Utils()
                            .createTextStyle(30, weight: FontWeight.w500, color: Colors.black)),
                    Expanded(child: Container())
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                child: Text(Get.arguments['text'],
                    style:
                        Utils().createTextStyle(17, color: Color(0xffb8b8b8))),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.watch_later, color: Colors.yellow),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Get.arguments['name'],
                          style: Utils().createTextStyle(18,
                              weight: FontWeight.w500,
                              color: Color(0xff303030))),
                      Text("Deadline",
                          style: Utils()
                              .createTextStyle(18, color: Color(0xffa0a0a0)))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.monetization_on, color: Color(0xfffb8789)),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Get.arguments['prize'],
                            style: Utils().createTextStyle(18, color: Color(0xffadadaa), weight: FontWeight.w700)),
                          Text("Prize", style: Utils().createTextStyle(18, color: Color(0xffacacac)))
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star_border_purple500, color: Colors.yellowAccent),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Top Level ",
                            style: Utils().createTextStyle(18, color: Colors.blueGrey, weight: FontWeight.w700)),
                          Text("Entry",
                            style: Utils().createTextStyle(18, color: Colors.redAccent[400]!))
                        ],
                      )
 
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }

  Widget images() => Stack(
    children: [
      for(int i = 0; i < imgs.length; i++)
      Positioned(
        top: 590,
        left: (20+i*35).toDouble(),
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imgs[i]['img']),
              fit: BoxFit.cover
            )
          ),
        )
      )
    ],
  );

  Widget favourites() => Positioned(
    top: 670,
    left: 25,
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xfffbc33e)
          ),
          child: Icon(Icons.favorite_border, color: Colors.white)
        ),
        SizedBox(width: 10,),
        Text("Add to favorite", style: Utils().createTextStyle(18, color: Color(0xfffbc33e)))
      ],
    )
  );
}
