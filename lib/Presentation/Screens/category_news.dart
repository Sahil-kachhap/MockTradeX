import 'package:flutter/material.dart';
import 'package:mock_tradex/Data/Data_Provider/news.dart';
import 'package:mock_tradex/Data/Models/article.dart';
import 'package:mock_tradex/Presentation/Widgets/news_card.dart';

class CategoryNews extends StatefulWidget {
  final String? category;

  const CategoryNews({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    NewsForCategory newsClass = NewsForCategory();
    await newsClass.getNewsForCategory(widget.category!);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080c10),
      appBar: AppBar(
        title: const Text('Market News'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: const Color(0xff080c10),
        elevation: 0,
      ),
      body: _loading
          ? Container(
              child: const Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                            url: articles[index].url,
                          );
                        }),
                  ),
                ]),
              ),
            ),
    );
  }
}
