import'package:get/get.dart';
import '../model/Coin.dart';
import 'package:http/http.dart'as http;
class CoinController extends GetxController{
 RxList<Coin> coinslist=<Coin>[].obs;
 RxBool isLoading=true.obs;

 @override
  void onInit() {
   super.onInit();
   fetchCoins();
//
  }

  fetchCoins()async{
   try{
     isLoading(true);
     var response=await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
     List<Coin> coins=coinFromJson(response.body);
     coinslist.value=coins;
   }finally{
     isLoading(false);

   }


 }


}
