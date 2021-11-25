import 'package:change_viewport_on_scroll_start/detail_view_screen.dart';
import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

class CarouselHolder extends StatefulWidget {
  const CarouselHolder({Key? key}) : super(key: key);

  @override
  _CarouselHolderState createState() => _CarouselHolderState();
}

class _CarouselHolderState extends State<CarouselHolder> {
  int currentPage = 0;

  double factor = 0.90;

  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, i) {
              return Opacity(
                opacity: currentPage == i ? 1.0 : 0.8,
                child: DetailViewScreen(
                  singleNews: news[i],
                  onViewPortFactorChanged: (double val) {
                    setState(() {
                      // fullScreen = val == 1.0 ? true : false;
                      factor = val;
                    });
                  },
                ),
              );
            },
            itemCount: news.length,
            controller:
                PageController(initialPage: 0, viewportFraction: factor),
            onPageChanged: (i) {
              setState(() {
                factor = 0.90;
                currentPage = i;
              });
            },
          ),
        ],
      )),
    );
  }
}
