import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({ Key? key }) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int currentIndex = 0;
  List lists = [];
  List infos = [];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/recent.json").then((s) {
      setState(() {
        lists = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((s) {
      setState(() {
        infos = json.decode(s);
      });
    });
  }


  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        color: Color(0xFFc5e5f3),
        child: Column(
          children: [
            // load one person
            Container(
              width: width,
              height: 100,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd)
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("images/background.jpg")
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jamy Moofle", style: TextStyle(
                          color: Color(0XFF3b3f42),
                          fontSize: 18,
                          decoration: TextDecoration.none
                        )),
                        SizedBox(height: 5),
                        Text("Top Level",
                        style: TextStyle(
                          color: Color(0xFFadecb7),
                          fontSize: 18,
                          decoration: TextDecoration.none
                        ))
                      ]
                    ),
                    Expanded(
                      child: Container()
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFc3fafc)
                      ),
                      child: Center(
                        child: Icon(Icons.notifications, color: Color(0xFF69c5df), size: 30)
                      )
                    )
                  ]
                )
              )
            ),
            SizedBox(height: 30),
            // popular contest
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text("Popular contest",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none
                    )),
                  Expanded(child: Container()),
                  Text("Show all", style: TextStyle(
                    color: Color(0XFFcfd5b3),
                    fontSize: 15,
                    decoration: TextDecoration.none
                  )),
                  SizedBox(width: 5),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xfffdc33c)
                    ),
                    child: GestureDetector()
                  )
                ]
              )
            ),
            SizedBox(height: 20),
            list(width),
            SizedBox(height: 30),
            recentContests(),
            SizedBox(height: 30),
            recentList(width)
          ]
        )
      )
    );
  }

  Widget list(double width) => Container(
    height: 210,
    child: PageView.builder(
      controller: PageController(viewportFraction: 0.88),
      itemCount: infos.length,
      itemBuilder: (_, i) {
        return GestureDetector(
          onTap: () {
            Get.toNamed("/detail");
          },
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            height: 210,
            width: MediaQuery.of(context).size.width-20,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: i.isEven? Color(0xff69c5df) : Color(0xff9294cc)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(infos[i]['title'], style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    )),
                    Expanded(child: Container())
                  ]
                ),
                SizedBox(height: 10),
                Container(
                  width: width,
                  child: Text(
                    infos[i]['text'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffb6eefc)
                    )
                  )
                ),
                SizedBox(height: 5),
                Divider(thickness: 1.2),
                Row(
                  children: [
                    for(int i = 0; i< 4; i++)
                      Container(
                        width: 50,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage(infos[i]['img']),
                              fit: BoxFit.cover
                            )
                          )
                        )
                      )
                  ]
                )
              ]
            )
          )
        );
      }
    )
  );

  Widget recentContests() => Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Row(
      children: [
        Text("Recent contests", style: TextStyle(
          color: Color(0xff1f2326),
          fontSize: 20,
          decoration: TextDecoration.none
        )),
        Expanded(child: Container()),
        Text('show all', style: TextStyle(
          color: Color(0xffcfd51b),
          fontSize: 20,
          decoration: TextDecoration.none
        )),
        SizedBox(width: 5),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0Xfffdc333c)
          ),
          child: GestureDetector()
        )
      ]
    )
  );

  Widget recentList(double w) => Expanded(
    child: MediaQuery.removePadding(context: context, removeTop: true,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: lists.length,
        itemBuilder: (_, i) {
          return Container(
            width: w,
            height: 100,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Color(0xFFebf8fd),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/background.jpg")
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("status", style: TextStyle(
                        color: Color(0xfffdebb2),
                        fontSize: 12,
                        decoration: TextDecoration.none
                      )),
                      SizedBox(height: 5),
                      SizedBox(width: 170, 
                        child: Text('Text',
                          style: TextStyle(
                            color: Color(0Xff3b3f42),
                            fontSize: 18,
                            decoration: TextDecoration.none
                          )))
                    ]
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 70,
                    height: 70,
                    child: Text(
                      "Time",
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.none,
                        color: Color(0xffb2b8bb)
                      )
                    )
                  )
                ]
              )
            )
          );
        }
      )),
  );
}