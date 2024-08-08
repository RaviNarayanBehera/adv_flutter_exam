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



