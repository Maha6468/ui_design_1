import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String selectedSize = "Venti";
  int quantity=1;

  final List<Map<String, String>> sizes = [
    {"label": "Tall", "volume": "12 Fl Oz"},
    {"label": "Grande", "volume": "16 Fl Oz"},
    {"label": "Venti", "volume": "24 Fl Oz"},
    {"label": "Custom", "volume": "-- Fl Oz"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Center(
                child: Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              trailing: Icon(Icons.shopping_bag_outlined, color: Colors.amber),
            ),
            SizedBox(height: 60),

            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  height: 320,
                  bottom: -28,
                  child: Image.asset(
                    "assets/images/img.png",
                    height: 300,
                    //fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Caramel \nFrappuccino",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Column(
                    children: [
                      Text(
                        "\$30.00",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text("Best Sales",style: TextStyle(fontSize: 11,color: Colors.grey),)
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Size Options",style: TextStyle(color: Colors.grey,fontSize: 18),)),
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: sizes.map((size) {
                final isSelected = selectedSize == size["label"];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size["label"]!;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color:
                          isSelected ? Colors.green : Colors.grey.shade200,
                          shape: BoxShape.circle,
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                          ],
                        ),
                        child: Icon(
                          Icons.local_cafe,
                          size: 28,
                          color: isSelected ? Colors.white : Colors.green,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        size["label"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isSelected ? Colors.green : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        size["volume"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),



            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,width: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: (){
                            setState(() {
                              quantity--;
                            });
                          },
                          icon: Icon(Icons.remove)),
                    ),
                    SizedBox(width: 5,),

                    Text(quantity.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Container(
                      height: 40,width: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: (){
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add)),
                    ),

                  ],
                ),

                SizedBox(
                  height: 55,width: 180,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                      ),
                      onPressed: (){},
                      child:Text("Add to Order",style: TextStyle(color: Colors.white),)),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}