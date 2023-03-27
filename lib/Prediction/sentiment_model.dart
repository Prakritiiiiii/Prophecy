// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// class PredModel {
//   late Map<String, int> mySentimentMap;
//   //pulling data from our ml model
//
//   Future<void> predData() async {
//     final interpreter1 = await Interpreter.fromAsset('prediction_btc.tflite');
//     final interpreter2 = await Interpreter.fromAsset('prediction_eth.tflite');
//     final interpreter3 =
//     await Interpreter.fromAsset('prediction_solana.tflite');
//     final interpreter4 = await Interpreter.fromAsset('prediction_bnb.tflite');
//     final interpreter5 =
//     await Interpreter.fromAsset('prediciton_cardano.tflite');
//     var input1 = [0.006417];
//     var input2 = [0.006417];
//     var input3 = [0.006417];
//     var input4 = [0.006417];
//     var input5 = [0.006417];
//     var output1 = List.filled(1, 0).reshape([1, 1]);
//     var output2 = List.filled(1, 0).reshape([1, 1]);
//     var output3 = List.filled(1, 0).reshape([1, 1]);
//     var output4 = List.filled(1, 0).reshape([1, 1]);
//     var output5 = List.filled(1, 0).reshape([1, 1]);
//     interpreter1.run(input1, output1);
//     interpreter2.run(input2, output2);
//     interpreter3.run(input3, output3);
//     interpreter4.run(input4, output4);
//     interpreter5.run(input5, output5);
//     print(output1[0][0]);
//     mySentimentMap = {
//       'btc': output1[0][1],
//       'eth': output2[0][1],
//       'sol': output3[0][1],
//       'bnb': output4[0][1],
//       'ada': output5[0][1],
//     };
//   }
//
//   int? getValue(String key) => mySentimentMap[key];
// }