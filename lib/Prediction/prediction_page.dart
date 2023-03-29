import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';



import '../controllers/coin_controller.dart';
import 'package:get/get.dart';

import '../Data/data.dart';
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
  Data data = new Data();
  late String cryptoSymbol;

  _PredictionPageState(this.coin);

  @override
  Widget build(BuildContext context) {
    cryptoSymbol = coin.symbol;
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
    appBar: AppBar(
      elevation: 0.0,
      title: const Text('Tomorrows Predicted Value'),
      backgroundColor: Color(0xFF1f1545),
      centerTitle: true,

      ),
      // body:Container(
      //   child: SingleChildScrollView(
      //
      //   ),
      // ),
      body: Padding(padding: EdgeInsets.all(16),

      child:SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,

      children: [

        /*const Text('Tomorrows Predicted Value',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Color(0xFF0D47A1),
      ),
      ),*/

        SizedBox(height:30),
      //color: Color(0xFF81D4FA),
      // borderRadius:BorderRadius.only(
      //   topLeft: Radius.circular(30),
      //   topRight: Radius.circular(30),

        Row(

          mainAxisAlignment:
          MainAxisAlignment.start,  //divides space evenly between children
          children: [
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
                child: Image.network(coin.image),
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
                coin.name,
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF1f1545),
                    fontWeight:
                    FontWeight.w700)),

              Text(
              coin.symbol,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600)),
          ],

        ),
        ],
        ),


            SizedBox(height: 20),

            Text(data.getValue(cryptoSymbol).toString(),
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF1f1545),
                fontWeight: FontWeight.w800)),

        SizedBox(height: 10),


        SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 150,
              showLabels: true,
              //labelOffset: 30,
              //radiusFactor: 0.8,
              //labelsPosition: GaugeElementPosition.outside,
              axisLabelStyle: GaugeTextStyle(fontSize: 12),
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.red, label:'safe'),
                GaugeRange(
                startValue: 50, endValue: 100, color: Colors.orange, label : 'medium'),
            GaugeRange(startValue: 100, endValue: 150, color: Colors.green,label: 'risky'),
          ], pointers: <GaugePointer>[
            NeedlePointer(
                value: data.getSentimentValue(cryptoSymbol)?.toDouble() ??
                    0.0)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]


      /*ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      // Coin item = coinController1.coinslist[index];
      print('Title: ${coin.name}');
      child:
      return Padding(
      padding: const EdgeInsets.all(20.0),
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
      /*SizedBox(
      width: 20,
      child: IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () {},
      ) //Text("Add to Favourites")
      ),*/
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(coin.name,
      style: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600)),
      Text("${coin.priceChangePercentage24H}%",
      style: TextStyle(
      fontSize: 18,
      color: Colors.black,
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
      color: Colors.black,
      fontWeight: FontWeight.w600)),
      Text(coin.symbol,
      style: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600)),
      ],
      ),
      ],
      ),
      ),
      );
      },
      ),*/


      ),
        ],
      ),
      ),

      ),

      );


    }
  }