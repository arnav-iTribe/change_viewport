import 'package:change_viewport_on_scroll_start/detail_view_screen.dart';
import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailViewScreenCarousel extends StatefulWidget {
  const NewsDetailViewScreenCarousel({Key? key}) : super(key: key);

  @override
  _NewsDetailViewScreenCarouselState createState() =>
      _NewsDetailViewScreenCarouselState();
}

class _NewsDetailViewScreenCarouselState
    extends State<NewsDetailViewScreenCarousel> {
  int currentPage = 0;

  // final FocusNode _focus = FocusNode();

  // void _onFocusChange() {
  //   debugPrint('Focus: ${_focus.hasFocus.toString()}');
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _focus.addListener(_onFocusChange);
  // }

  // @override
  // void dispose() {
  //   _focus.removeListener(_onFocusChange);
  //   super.dispose();
  // }

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
                child: NewsDetailViewScreen(
                  // viewportFactor: viewportFactor,//test this
                  singleNews: news[i],
                  onViewPortFactorChanged: (double val) {
                    setState(() {
                      fullScreen = val == 1.0 ? true : false;
                    });
                  },
                ),
              );
            },
            itemCount: news.length,
            controller: PageController(
                initialPage: 0, viewportFraction: fullScreen ? 1.0 : 0.90),
            onPageChanged: (i) {
              setState(() {
                currentPage = i;
              });
            },
          ),
        ],
      )),
    );
  }
}
