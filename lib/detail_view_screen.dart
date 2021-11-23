import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetailViewScreen extends StatefulWidget {
  NewsDetailViewScreen({
    Key? key,
    required this.singleNews,
    this.onViewPortFactorChanged,
  }) : super(key: key);
  final NewsModel singleNews;
  Function(double)? onViewPortFactorChanged;

  @override
  State<NewsDetailViewScreen> createState() => _NewsDetailViewScreenState();
}

class _NewsDetailViewScreenState extends State<NewsDetailViewScreen> {
  final String route = '/news_detail_view_screen';

  ScrollController? _controller;

  _scrollListener() {
    // if (_controller!.offset >= _controller!.position.maxScrollExtent &&
    //     !_controller!.position.outOfRange) {
    //   print('reached the bottom');
    //   // setState(() {
    //   //   isBottomVisited++;
    //   // });
    // }
    // if (_controller!.offset <= _controller!.position.minScrollExtent &&
    //     !_controller!.position.outOfRange) {
    //   print('reached the top');
    // }
    //-----
    // if (_controller!.offset >= 15.0) {
    //   widget.onViewPortFactorChanged!(1.0);
    //   setState(() {
    //     isFull = true;
    //   });
    //   print(isFull);
    // } else {
    //   widget.onViewPortFactorChanged!(0.90);
    //   setState(() {
    //     isFull = false;
    //   });
    //   print(isFull);
    // }
    //----------------------------------------------------------------
    // if (_controller!.offset >= 15.0) {
    //   widget.onViewPortFactorChanged!(1.0);
    // }

    for (int i = 1; i <= 20; i++) {
      if (_controller!.offset >= (10 + i * (20))) { // todo: use less than condition 
        print('viewport changing-------------------' '$i');
        widget.onViewPortFactorChanged!(0.90 + (i / 200));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller!.dispose();
    // _controller!.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: detailViewScreenContent(),
    );
  }

  Widget detailViewScreenContent() {
    const verticalDividerSpace = SizedBox(height: 12);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.singleNews.newsImageUrl),
          verticalDividerSpace,
          verticalDividerSpace,
          verticalDividerSpace,
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
          verticalDividerSpace,
          newsContentHolderWidget(context, widget.singleNews.description),
          verticalDividerSpace,
          verticalDividerSpace,
          Container(height: 300, color: Colors.pinkAccent),
          verticalDividerSpace,
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Company Suggestions',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
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
    );
  }

  Widget newsContentHolderWidget(BuildContext context, String newsContent) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          newsContent,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black,
                height: 1.8,
                letterSpacing: 0.10,
              ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
