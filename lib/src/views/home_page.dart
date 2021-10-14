import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/src/views/content_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69c5df), 
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 700,
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pick your favorite",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                Text("Contests",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 40,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 25,
                    child: Text("We make great design work "
                      "happen with our great community designer",
                      style: TextStyle(color: Colors.white60)),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfffbc33e)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xfffbc33e),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                      ),
                      onPressed: () => Get.to(() => ContentPage()),
                      child: Text("Get Started", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 20,),
              ],
            ),
          )
        ],
      )
    );
  }
}
