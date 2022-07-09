import '../Models/article.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
class News{
  List<ArticleModel> news =[];

 Future<void> getNews() async{
   String BaseUrl = "https://newsapi.org/v2/everything?domains=cointelegraph.com&apiKey=9c03c83979df4c3b8ca1baf53ed28483&sortBy=publishedAt&language=en&pageSize=100";

   final url=Uri.parse(BaseUrl);

   final Response response = await http.get(url);

   if (response.statusCode == 200) {
     final jsonResponse = convert.jsonDecode(response.body);
     for(var article in jsonResponse['articles']){
       if(article['urlToImage']!=null&&article['description']!=null)
         {
            ArticleModel articleModel = ArticleModel(
              title:article['title'],
              description: article['description'] ,
              urlToImage: article['urlToImage'],
              author: article['author'],
              content: article['content'],
              url: article['url'],
              publishedAt: DateTime.parse(article['publishedAt']),
              name: article['source']['name'],
              //publishedAt: article['publishedAt'],

            );
            news.add(articleModel);
         }
     }
   } else {
     print('Request failed with status: ${response.statusCode}.');
   }



 }

}

class NewsForCategory{
  List<ArticleModel> news =[];

  Future<void> getNewsForCategory(String category) async{
      String BaseUrl="https://newsapi.org/v2/everything?apiKey=9c03c83979df4c3b8ca1baf53ed28483&sortBy=publishedAt&language=en&q=${category}";

    final url=Uri.parse(BaseUrl);

    final Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for(var article in jsonResponse['articles']){
        if(article['urlToImage']!=null&&article['description']!=null)
        {
          ArticleModel articleModel = ArticleModel(
            title:article['title'],
            description: article['description'] ,
            urlToImage: article['urlToImage'],
            author: article['author'],
            content: article['content'],
            url: article['url'],
            publishedAt: DateTime.parse(article['publishedAt']),
            name: article['source']['name'],

          );
          news.add(articleModel);
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }



  }

}