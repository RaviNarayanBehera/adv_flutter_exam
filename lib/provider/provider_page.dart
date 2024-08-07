import 'package:adv_flutter_exam/api_helper/page_api_Helper.dart';
import 'package:adv_flutter_exam/modal/modal_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteProvider extends ChangeNotifier {
  Helper helper = Helper();
  QuotesModel? quotesModel;
  List<String> liked = [];


  Future<QuotesModel?> fromMap()
  async {
   final data = await helper.fetchApiData();
   quotesModel = QuotesModel.fromJson(data);
   return quotesModel;
  }


  Future<void> addFav(String quotes, String author)
  async {
    String like = '$quotes - $author';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    liked.add(like);
    sharedPreferences.setStringList('liked', liked);
  }

  Future<void> getFav()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    liked = sharedPreferences.getStringList('liked')??[];
    print(liked);
    notifyListeners();
  }

  Future<void> delete(int index)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    liked.removeAt(index);
    sharedPreferences.setStringList('liked', liked);
    notifyListeners();
  }

  QuoteProvider(){
    print(liked);
    getFav();
  }
}










































































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../modal/post_modal.dart';
//
//
// class PostProvider extends ChangeNotifier {
//   late PostModel postModel;
//
//   Future<void> initPost() async {
//     String json = await rootBundle.loadString('assets/json/post.json');
//     final response = jsonDecode(json);
//     postModel = PostModel.fromJson(response);
//     notifyListeners();
//   }
//
//   PostProvider() {
//     initPost();
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'api_helper.dart';
// import 'modal_class.dart';
//
// class WeatherProvider extends ChangeNotifier
// {
//   Helper helper = Helper();
//   WeatherModal? weatherModal;
//   String search = 'surat';
//   List<String> weather = [];
//
//   void searchCity(String city)
//   {
//     search = city;
//     notifyListeners();
//   }
//
//   Future<WeatherModal?> fromMap(String city)
//   async {
//     final data = await helper.fetchApiData(search);
//     weatherModal = WeatherModal.fromJson(data);
//     return weatherModal;
//   }
//
//   Future<void> addFav(String name, String status, String temp,String icon,)
//   async {
//     String like = "$name-$status-$temp-$icon";
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     weather.add(like);
//     sharedPreferences.setStringList('weather', weather);
//   }
//
//   Future<void> getFav()
//   async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     weather = sharedPreferences.getStringList('weather')??[];
//     print(weather);
//     notifyListeners();
//   }
//
//   Future<void> delete(int index)
//   async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     weather.removeAt(index);
//     sharedPreferences.setStringList('weather', weather);
//     notifyListeners();
//   }
//
//
//   WeatherProvider(){
//     print(weather);
//     getFav();
//   }
//
//
// }
