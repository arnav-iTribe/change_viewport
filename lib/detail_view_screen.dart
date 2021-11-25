import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({
    Key? key,
    required this.singleNews,
    this.onViewPortFactorChanged,
  }) : super(key: key);

  final NewsModel singleNews;
  final Function(double)? onViewPortFactorChanged;

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  ScrollController? _scrollController;
  double factor = 0.90;
  double x = 0;

  // _scrollListener() {
  //   for (int i = 1; i <= 20; i++) {
  //     if (_scrollController!.offset >= i * 20 &&
  //         _scrollController!.offset < 401.0) {
  //       widget.onViewPortFactorChanged!(0.90 + (i / 200));
  //     }
  //   }
  // }

  // _scrollListener() {
  //   for (int i = 1; i <= 20; i++) {
  //     if (_scrollController!.offset >= i * 20 &&
  //         _scrollController!.offset < 401.0) {
  //       print('scrolling');
  //     }
  //   }
  // }

  // _scrollListener() {
  //   for (int i = 1; i <= 20; i++) {
  //     if (_scrollController!.offset >= i * 10 &&
  //         _scrollController!.offset < 202.0) {
  //       setState(() {
  //         x += .005;
  //       });
  //     }
  //     break;
  //   }
  // }

  _scrollListener() {
    if (_scrollController!.offset >= 10) {
      setState(() {
        factor = 0.99;
      });
    }
    if (_scrollController!.offset == 0) {
      setState(() {
        factor = 0.90;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    // _controller!.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: detailViewScreenContent(),
    );
  }

  Widget detailViewScreenContent() {
    const verticalDividerSpace = SizedBox(height: 24);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 4),
          // color: Colors.pinkAccent,
          width: MediaQuery.of(context).size.width * factor,
          height: 200,
          child: Image.network(widget.singleNews.newsImageUrl),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width * factor,
        //   height: 150,
        //   child: Image.network(widget.singleNews.newsImageUrl),
        // ),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalDividerSpace,
                Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMak'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    widget.singleNews.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 19.45),
                  ),
                ),
                verticalDividerSpace,
                Container(height: 300, color: Colors.pinkAccent),
                verticalDividerSpace,
                Container(
                  height: 400,
                  color: Colors.amberAccent,
                ),
                verticalDividerSpace,
                Container(
                  height: 400,
                  color: Colors.greenAccent,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
