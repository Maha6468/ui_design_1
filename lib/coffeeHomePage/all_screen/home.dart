import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              leading: Icon(Icons.baby_changing_station),
              title: Text("Qahwa",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle:Text("Space"),
              trailing: IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Details()));
              }, icon: Icon(Icons.shopping_bag_outlined,color: Colors.amber,size: 35,)),
            ),


            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Smooth Out \nYour Everyday",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: size.width * 0.07),),
              ),
            ),


            Flexible(
              child: ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF1E4D2B),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Transform.translate(
                              offset: const Offset(-15, 45),
                              child: _buildCategoryItem("☕", "HOT COFFEE",size),
                            ),
                            Transform.translate(
                              offset: const Offset(-4, 12),
                              child: _buildCategoryItem("🥤", "DRINKS",size),
                            ),
                            Transform.translate(
                              offset: const Offset(4, 12),
                              child: _buildCategoryItem("🍵", "HOT TEAS",size),
                            ),
                            Transform.translate(
                              offset: const Offset(15, 45),
                              child: _buildCategoryItem("🧁", "BAKERY",size),
                            ),
                          ],
                        ),
                      ),

                      Image.asset(
                        "assets/images/img.png",
                        height: size.height * 0.20,
                        fit: BoxFit.contain,
                      ),
                      const Text(
                        "Caramel \nFrappuccino",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "\$30.00",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 90);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      90,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



Widget _buildCategoryItem(String icon, String title,Size size) {
  return Column(
    children: [
      CircleAvatar(
        // radius: 30,
        radius: size.width * 0.07,
        backgroundColor: Colors.white,
        child: Text(icon, style:  TextStyle(
          // fontSize: 30,
            fontSize: size.width * 0.07

        )),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        style: const TextStyle(
            fontSize: 9, fontWeight: FontWeight.w600, color: Colors.grey
        ),
      ),
    ],
  );
}