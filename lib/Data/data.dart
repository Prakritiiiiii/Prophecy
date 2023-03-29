class Data {
  Map<String, String> myMap = {
    'btc': '\$28219',
    'eth': '\$1781.4282',
    'sol': '\$19.78',
    'bnb': '\$331.76',
    'ada': '\$0.3616',
  };
  late Map<String, double> mySentimentMap = {
    'btc': 70,
    'eth': 105,
    'sol': 110,
    'bnb': 105,
    'ada': 30,
  };

  String? getValue(String key) => myMap[key];
  double? getSentimentValue(String key) => mySentimentMap[key];
}