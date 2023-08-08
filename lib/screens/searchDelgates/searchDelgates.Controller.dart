import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDelgatesController extends GetxController {
  RxBool isLoading = true.obs;
  final String key = 'history_search';
  late BuildContext context;

  TextEditingController textSearchNamePrd = TextEditingController();

  List<String> listSuggestedWord = ["ăn dặm","â","avent","sua","sửa chua","sửa tăm","sao"];

  List<Widget> getSuggestedWord(String value){
    isLoading.value = false;
    List<String> tempSuggestedWord = <String>[];
    for (var element in listSuggestedWord) {
      if(tempSuggestedWord.length < 3 && element.contains(value)){
        tempSuggestedWord.add(element);
      }
    }
    isLoading.value = true;
    return tempSuggestedWord.map((e) => Text(e)).toList();
  }

  void clearSuggestedWord(){
    isLoading.value = false;
    textSearchNamePrd.clear();
    getSuggestedWord;
    isLoading.value = true;
  }

  // Future<List<String>> getHistorySearch() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getStringList(key) ?? [];
  // }
  // Future<void> addHistorySearch(String searchTerm) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final historySearch = await getHistorySearch();
  //   historySearch.add(searchTerm);
  //   prefs.setStringList(key, historySearch);
  // }

  @override
  void dispose() {
    textSearchNamePrd.clear();
    super.dispose();
  }
}