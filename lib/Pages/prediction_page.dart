import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/coin_controller.dart';
import 'package:get/get.dart';

import '../model/Coin.dart';

class PredictionPage extends StatefulWidget {
  final Coin coin;
  //  PredictionPage(({Key? key}) : super(key: key));
  PredictionPage({super.key, required this.coin});
  @override
  State<PredictionPage> createState() => _PredictionPageState(coin);
}

class _PredictionPageState extends State<PredictionPage> {
  // final CoinController coinController1;
  final Coin coin;

  _PredictionPageState(this.coin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Tomorrows Prediction'),
        backgroundColor: Colors.black,
        //theme: ThemeData(fontFamily: 'Bebas Neue Regular'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      // body:Container(
      //   child: SingleChildScrollView(
      //
      //   ),
      // ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.grey,
          //color: Color(0xFF81D4FA),
          // borderRadius:BorderRadius.only(
          //   topLeft: Radius.circular(30),
          //   topRight: Radius.circular(30),
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // Coin item = coinController1.coinslist[index];
                  print('Title: ${coin.name}');
                  child:
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.network(coin.image),
                                ),
                              ),
                              SizedBox(
                                  width: 20,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite),
                                    onPressed: () {},
                                  ) //Text("Add to Favourites")
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(coin.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Text("${coin.priceChangePercentage24H}%",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("\$ ${coin.currentPrice}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              Text(coin.symbol,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                  GaugeRange(
                      startValue: 50, endValue: 100, color: Colors.orange),
                  GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: 70)
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text('70',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                      angle: 90,
                      positionFactor: 0.5)
                ])
              ])
            ],
          ),
        ),
      ),
    );
  }
}