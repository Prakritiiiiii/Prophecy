import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor/Authorization/change_password.dart';
//import 'package:minor/Pages/hover_page.dart';
//import 'dart:ui' show lerpDouble;
import 'package:get/get.dart';
import 'package:minor/Prediction/prediction_page.dart';
import 'package:minor/controllers/coin_controller.dart';

import '../model/Coin.dart';
//import 'package:firebase_auth/firebase_auth.dart'

int itemCount = 10;
List<bool> selected = new List<bool>.empty(growable: true);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  //List<String> itemList = Coin item;

  final CoinController coinController = Get.put(CoinController());
  final CoinController coinController1 = Get.put(CoinController());
  final user = FirebaseAuth.instance.currentUser!;
  String searchQuery = 'empty';

  Icon first_icon = Icon(Icons.favorite,color: Colors.red);
  Icon second_icon = Icon(Icons.favorite_outline,color: Colors.red);
  @override
  initState() {
    for (var i = 0; i < itemCount; i++) {
      selected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        elevation: 0.0,
        //title: const Text('Current Crypto Status'),
        backgroundColor: Color(0xFF1f1545),
        //centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],

      ),
      body: Padding(padding: EdgeInsets.all(16),

          child:SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [

            Text('Discover Todays Value',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
            )),

            SizedBox(height:20),

            TextField(
              onChanged: (value){
                setState(() {
                  searchQuery = value;
                });
              },
              style: TextStyle (color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'eg : search here',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            Obx(
                  () =>
              coinController.isLoading.value
                  ? Expanded(
                child: CircularProgressIndicator(),
              ) : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 100,
                  itemBuilder: (context, int index) {
                    selected.add(false);
                    Coin item=coinController1.coinslist[index];

                    if (item.name.toLowerCase().contains(searchQuery.toLowerCase())){
                      return GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PredictionPage(
                                          coin: item,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                //divides space evenly between children
                                children: [
                                  Row(
                                    children: [
                                      //image ko
                                      Container(
                                        //alignment: Alignment.topCenter ,
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(coinController1
                                              .coinslist[index].image),
                                        ),
                                      ),
                                      //bich ko space
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //bitcoin wala
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              coinController
                                                  .coinslist[index].name,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w700)),

                                          Text(
                                              coinController
                                                  .coinslist[index].symbol,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w600)),

                                          /* Text("LTP",
                                            style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w600)),*/

                                          Text("LTP: "
                                              "\$ ${coinController
                                              .coinslist[index]
                                              .currentPrice}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w600)),

                                          /* Text("CH%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),*/

                                          Text("CH%: "
                                              "${coinController.coinslist[index]
                                              .priceChangePercentage24H}%",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight:
                                                  FontWeight.w600)),


                                        ],
                                      ),
                                    ], //children
                                  ),


                                  /*Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [*/
                                  IconButton(
                                    icon: selected.elementAt(index)
                                        ? first_icon
                                        : second_icon,
                                    onPressed: () {
                                      try {
                                        // your code that you want this IconButton do
                                        setState(() {
                                          selected[index] =
                                          !selected.elementAt(index);
                                        });
                                        //print('tap on ${index + 1}th IconButton ( change to : ');
                                        //print(selected[index] ? 'active' : 'deactive' + ' )');
                                      } catch (e) {
                                        //print(e);
                                      };
                                    },
                                  ),
                                  //],
                                  //),
                                ],
                              ),
                            ),
                          ));

                    } else {
                      return GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PredictionPage(
                                          coin: item,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                //divides space evenly between children
                                children: [
                                  Row(
                                    children: [
                                      //image ko
                                      Container(
                                        //alignment: Alignment.topCenter ,
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.network(coinController
                                              .coinslist[index].image),
                                        ),
                                      ),
                                      //bich ko space
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //bitcoin wala
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              coinController
                                                  .coinslist[index].name,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w700)),

                                          Text(
                                              coinController
                                                  .coinslist[index].symbol,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w600)),

                                          /* Text("LTP",
                                            style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w600)),*/

                                          Text("LTP: "
                                              "\$ ${coinController
                                              .coinslist[index]
                                              .currentPrice}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight: FontWeight.w600)),

                                          /* Text("CH%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),*/

                                          Text("CH%: "
                                              "${coinController.coinslist[index]
                                              .priceChangePercentage24H}%",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blueGrey,
                                                  fontWeight:
                                                  FontWeight.w600)),


                                        ],
                                      ),
                                    ], //children
                                  ),


                                  /*Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [*/
                                  IconButton(
                                    icon: selected.elementAt(index)
                                        ? first_icon
                                        : second_icon,
                                    onPressed: () {
                                      try {
                                        // your code that you want this IconButton do
                                        setState(() {
                                          selected[index] =
                                          !selected.elementAt(index);
                                        });
                                        //print('tap on ${index + 1}th IconButton ( change to : ');
                                        //print(selected[index] ? 'active' : 'deactive' + ' )');
                                      } catch (e) {
                                        //print(e);
                                      };
                                    },
                                  ),
                                  //],
                                  //),
                                ],
                              ),
                            ),
                          ));
                    }
                  }),
            )
          ]),
        )
      ),
    );


      /*drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration (
                  color: Colors.blue,
                ),
                child: Text(user.email!),
              ),
              ListTile(
                leading: const Icon(Icons.password),
                title: const Text('Change password'),
                onTap: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) {
                    return ChangePassword();
                  },
                  ),
                  );
                },


              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete account'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sign Out'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  FirebaseAuth.instance
                      .signOut(); // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          )
      ),*/
    
  }
}
