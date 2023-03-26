import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor/Authorization/change_password.dart';
//import 'package:minor/Pages/hover_page.dart';
//import 'dart:ui' show lerpDouble;
import 'package:get/get.dart';
import 'package:minor/controllers/coin_controller.dart';

int itemCount = 10;
List<bool> selected = new List<bool>.empty(growable: true);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final CoinController coinController = Get.put(CoinController());
  final user = FirebaseAuth.instance.currentUser!;

  Icon first_icon = Icon(Icons.favorite_outline);
  Icon second_icon = Icon(Icons.favorite);
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
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Current Crypto Status'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],

      ),

      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          //color: Color(0xFF81D4FA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            Obx(
                  () =>
              coinController.isLoading.value
                  ? Center(
                child: CircularProgressIndicator(),
              ) : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    selected.add(false);
                    return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 135,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,  //divides space evenly between children
                              children: [
                                Row(
                                  children: [
                                    //image ko
                                    Container(
                                      //alignment: ,
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
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
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w700)),

                                        Text(
                                            coinController
                                                .coinslist[index].symbol,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),

                                        Text("LTP",
                                            style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w600)),

                                        Text(
                                            "\$ ${coinController.coinslist[index]
                                                .currentPrice}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),

                                        Text("CH%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),

                                        Text(
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
                                icon: selected.elementAt(index) ? first_icon : second_icon,
                            onPressed: () {
                              try {
                                // your code that you want this IconButton do
                                setState(() {
                                  selected[index] = !selected.elementAt(index);
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
                  }),
            )
          ]),
        ),
      ),

      drawer: Drawer(
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
      ),
    );
  }
}
