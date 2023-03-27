class Data {
  Map<String, String> myMap = {
    'btc': '\$26000',
    'eth': '\$26000',
    'sol': '\$26000',
    'bnb': '\$26000',
    'ada': '\$26000',
  };
  late Map<String, double> mySentimentMap = {
    'btc': 70,
    'eth': 105,
    'sol': 40,
    'bnb': 105,
    'ada': 30,
  };

  String? getValue(String key) => myMap[key];
  double? getSentimentValue(String key) => mySentimentMap[key];
}