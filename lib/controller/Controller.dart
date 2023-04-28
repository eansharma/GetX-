import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/modales/NewsModelas.dart';

import 'package:http/http.dart' as http;


class NewsController extends GetxController{
  var NewsDetailsList =<Articles>[].obs;
  var isLoading = true.obs;
  @override
  void onInit(){
    super.onInit();
    FatchData();

  }


  Future FatchData() async{
    try{
      isLoading(true);
      final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-03-12&sortBy=publishedAt&apiKey=f525ff400645424eab2fcf4da49a1a7d'));
      if(response.statusCode==200){

        var jsonResponse = jsonDecode(response.body);
        News news =News.fromJson(jsonResponse);
        NewsDetailsList.value = news.articles!;

        // if (temp.isNotEmpty) {
        //   for (var i = 0; i < temp.length; i++) {
        //     if (temp[i] != null) {
        //       Map<String, dynamic> map = temp[i];
        //       NewsDetailsList.add(
        //         Articles.fromJson(map),
        //       );
        //     }
        //   }
        //   print("Data is rescive");
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }

  }
}