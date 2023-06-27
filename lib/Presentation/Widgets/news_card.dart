import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mock_tradex/Presentation/Screens/article_view.dart';

class NewsCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;
  final String? url;

  const NewsCard({
    Key? key,
    this.imageUrl,
    this.title,
    this.description,
    this.url,
  }) : super(key: key);

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
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholderFadeInDuration: const Duration(milliseconds: 0),
                errorWidget: (context, url, x) =>
                    Image.asset('assets/dark-placeholder.png'),
                placeholder: (context, url) => SizedBox(
                    height: (MediaQuery.of(context).size.width - 32) * 0.66,
                    width: double.infinity,
                    child: Image.asset('assets/dark-placeholder.png')),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title!,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.white24, width: 1),
                ),
              ),
            ),
            const SizedBox(
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
