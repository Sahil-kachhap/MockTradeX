import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/article_view.dart';

import 'package:share_plus/share_plus.dart';

class NewsCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? url;
  final String? author;
  final DateTime? publishedAt;
  final String? name;


  const NewsCard({
    Key? key,
    this.imageUrl,
    this.title,
    this.description,
    this.url,
    this.author,
    this.publishedAt,
    this.name,
  }) : super(key: key);

  String? TimeConvertOutput(){

     int daypassed=(DateTime.now().day)-publishedAt!.add(Duration(hours: 5,minutes: 30)).day;
     String? publishedTime=daypassed.toString()+'d';
    if(daypassed==0){
      publishedTime='${publishedAt!.add(Duration(hours: 5,minutes: 30)).hour}:${publishedAt!.add(Duration(hours: 5,minutes: 30)).minute}';
    }

    else if(daypassed<0)
      publishedTime='${publishedAt!.day} / ${publishedAt!.month}';

    return publishedTime;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      url: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholderFadeInDuration: Duration(milliseconds: 0),
                errorWidget: (context, url, x) =>
                    Image.asset('assets/dark-placeholder.png'),
                placeholder: (context, url) => Container(
                    height: (MediaQuery.of(context).size.width - 32) * 0.66,
                    width: double.infinity,
                    child: Image.asset('assets/dark-placeholder.png')),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title!,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Text(
                      //author!.replaceAll('Cointelegraph By', ''),
                      '$name  ·  ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white38,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      //'${publishedAt==null?'':publishedAt!.add(Duration(hours: 5,minutes: 30))}',
                      TimeConvertOutput()!,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white38,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                  constraints: BoxConstraints(),

                  onPressed: () async{
                    print('$publishedAt');
                     //Share.share('${title}\n${url}');
                  },
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.white38,
                    size: 21,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.white12, width: 1),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // Text(
            //   description!,
            //   style: TextStyle(
            //     color: Colors.white30,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
