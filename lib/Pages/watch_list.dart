import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/coin_controller.dart';
import '../model/Coin.dart';

class WatchListPage extends StatelessWidget {
  WatchListPage({Key? key}) : super(key: key);

  final CoinController coinController = Get.put(CoinController());
  final CoinController coinController1 = Get.put(CoinController());
  late Coin item;
  final user = FirebaseAuth.instance.currentUser!;

  Icon first_icon = Icon(Icons.favorite, color: Colors.red);
  Icon second_icon = Icon(Icons.favorite_outline, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Wishlist'),
          backgroundColor: Color(0xFF1f1545),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                          () => coinController.isLoading.value
                          ? Expanded(
                        child: CircularProgressIndicator(),
                      )
                          : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, int index) {
                            item = coinController1.coinslist[index];
                            return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, //divides space evenly between children
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
                                                  BorderRadius.circular(
                                                      20)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Image.network(
                                                    coinController
                                                        .coinslist[index]
                                                        .image),
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
                                                        .coinslist[index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Color(
                                                            0xFF1f1545),
                                                        fontWeight:
                                                        FontWeight
                                                            .w700)),
                                                Text(
                                                    coinController
                                                        .coinslist[index]
                                                        .symbol,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                        Colors.blueGrey,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600)),

                                                /* Text("LTP",
                                            style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w600)),*/

                                                Text(
                                                    "LTP: "
                                                        "\$ ${coinController.coinslist[index].currentPrice}",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                        Colors.blueGrey,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600)),

                                                /* Text("CH%",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w600)),*/

                                                Text(
                                                    "CH%: "
                                                        "${coinController.coinslist[index].priceChangePercentage24H}%",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                        Colors.blueGrey,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600)),
                                              ],
                                            ),
                                          ], //children
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    )
                  ]),
            )));
  }
}