import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsprovider/src/models/category_mode.dart';
import 'package:newsprovider/src/models/news_models.dart';

import 'package:http/http.dart'  as http;
class NewsService with ChangeNotifier{

  List<Article> headlines =[];

  String _selectedCategory ='business';
  List<Category> categorys = [
    Category(FontAwesomeIcons.building,'business'),
    Category(FontAwesomeIcons.tv,'entertainment'),
    Category(FontAwesomeIcons.addressCard,'general'),
    Category(FontAwesomeIcons.headSideVirus,'health'),
    Category(FontAwesomeIcons.vials,'science'),
    Category(FontAwesomeIcons.volleyballBall,'sports'),
    Category(FontAwesomeIcons.memory,'technology'),
  ];
   
  bool _isLoading = true;

  final _URLBASE='https://newsapi.org/v2';
  final _APIKEY='3a61324521464e9bbac196c6776afd0f';
  
   Map<String, List<Article>> categoryArticles={};

  NewsService(){
   this.getTopHeadlines();

   categorys.forEach((item) { 
     this.categoryArticles[item.name] = [];
   });
    this.getArticlesByCategory('business');

  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
   this._selectedCategory=valor;
   this._isLoading = true;
   this.getArticlesByCategory(valor);
   notifyListeners();
  }

  bool get isLoading => this._isLoading;
  get getArticlesCategorySelected => this.categoryArticles[this.selectedCategory];

  getArticlesByCategory(String category)  async{
     
    if(this.categoryArticles[category].length>0){
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }

    final url = Uri.parse('$_URLBASE/top-headlines?apiKey=$_APIKEY&country=us&category=$category');
    final resp = await http.get(url);

    final newResp = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newResp.articles);
    this._isLoading = false;
    notifyListeners();
  }

  getTopHeadlines() async{
    final url = Uri.parse('$_URLBASE/top-headlines?apiKey=$_APIKEY&country=us');
    final resp = await http.get(url);

    final newResp = newsResponseFromJson(resp.body);

    this.headlines.addAll(newResp.articles);

    notifyListeners();
  }
}