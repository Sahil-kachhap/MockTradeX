import 'package:flutter/material.dart';
import 'package:mock_tradex/Data/Data_Provider/news.dart';
import 'package:mock_tradex/Data/Models/article.dart';
import 'package:mock_tradex/Data/Models/newsCategory.dart';
import 'package:mock_tradex/Presentation/Screens/category_news.dart';
import 'package:mock_tradex/Presentation/Widgets/news_card.dart';
import 'package:mock_tradex/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../Data/Data_Provider/sentiment_api.dart';
import '../../Data/Repositories/news_category_repo.dart';

class NEWSPage extends StatefulWidget {
  const NEWSPage({Key? key}) : super(key: key);

  @override
  State<NEWSPage> createState() => _NEWSPageState();
}

class _NEWSPageState extends State<NEWSPage>
    with AutomaticKeepAliveClientMixin {
  List<CategoryModel> category = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    category = getCategories();
    getNews();
    sentimentUpdater();
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  void sentimentUpdater() async {
    await getSentiment();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xff080c10),
      appBar: AppBar(
        title: const Text('Market News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_circle),
            onPressed: () {
              showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SentimentMeter();
                  });
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
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imagePath: category[index].imagePath,
                                categoryName: category[index].categoryName,
                              );
                            }),
                      ),
                    ),
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
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String? imagePath, categoryName;
  const CategoryTile({Key? key, this.imagePath, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName!.toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(imagePath!,
                    width: 120, height: 60, fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categoryName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SentimentMeter extends StatefulWidget {
  const SentimentMeter({Key? key}) : super(key: key);

  @override
  State<SentimentMeter> createState() => _SentimentMeterState();
}

class _SentimentMeterState extends State<SentimentMeter> {
  double emotionNum = double.tryParse(emotionValue)!;
  Set<Color> sentimentColor = {
    const Color(0xffff0000),
    const Color(0xffff0000),
    const Color(0xfff96600),
    const Color(0xfff08100),
    const Color(0xffe39a00),
    const Color(0xffd2b100),
    const Color(0xffbdc700),
    const Color(0xffa3da00),
    const Color(0xff81ed00),
    const Color(0xff48ff00),
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGraphPageBackground,
        border: Border.all(color: const Color(0xFF272D31)),
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width - 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  'Fear and Greed Index',
                  style: TextStyle(
                    color: kTickerWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'NOW: ',
                            style: TextStyle(
                              color: kTickerWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            emotion,
                            style: TextStyle(
                              color: Color.lerp(const Color(0xffff0000),
                                  const Color(0xff48ff00), emotionNum / 100),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${emotionNum.toInt()}',
                        style: TextStyle(
                          color: Color.lerp(const Color(0xffff0000),
                              const Color(0xff48ff00), emotionNum / 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 260,
                width: 260,
                child: SfRadialGauge(
                  backgroundColor: kGraphPageBackground,
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 180,
                      endAngle: 0,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: const AxisLineStyle(
                        // cornerStyle: CornerStyle.bothCurve,
                        color: Colors.red,
                        thickness: 22,
                        gradient: SweepGradient(
                          colors: [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow,
                            Colors.green,
                          ],
                          stops: [0, 0.25, 0.55, 1],
                        ),
                      ),
                      // ranges: <GaugeRange>[
                      //   GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                      //   GaugeRange(startValue: 40, endValue: 60, color: Colors.orange),
                      //   GaugeRange(startValue: 60, endValue: 100, color: Colors.red)
                      // ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                            knobStyle: const KnobStyle(
                                knobRadius: 0.1,
                                sizeUnit: GaugeSizeUnit.factor,
                                color: Colors.black),
                            lengthUnit: GaugeSizeUnit.logicalPixel,
                            needleLength: 100,
                            needleStartWidth: 2,
                            needleEndWidth: 6,
                            gradient: const LinearGradient(colors: <Color>[
                              Color(0xFFE5E5E5),
                              Colors.black54,
                            ], stops: <double>[
                              0,
                              1
                            ]),
                            needleColor: const Color(0xFFF67280),
                            value: emotionNum),
                      ],

                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 0,
                          horizontalAlignment: GaugeAlignment.center,
                          verticalAlignment: GaugeAlignment.center,
                          widget: Container(
                            width: 40.00,
                            height: 40.00,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    ExactAssetImage('assets/bitcoin-logo.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const FloatingModal({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          child: child,
        ),
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => FloatingModal(
            child: child,
          ),
      expand: false);

  return result;
}
