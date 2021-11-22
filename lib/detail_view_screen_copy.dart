// import 'package:change_viewport_on_scroll_start/news_model.dart';
// import 'package:flutter/material.dart';

// class NewsDetailViewScreen extends StatefulWidget {
//   const NewsDetailViewScreen({Key? key, required this.singleNews})
//       : super(key: key);
//   final NewsModel singleNews;

//   @override
//   State<NewsDetailViewScreen> createState() => _NewsDetailViewScreenState();
// }

// class _NewsDetailViewScreenState extends State<NewsDetailViewScreen> {
//   final String route = '/news_detail_view_screen';
//   ScrollController? _controller;

//   _scrollListener() {
//     if (_controller!.offset >= _controller!.position.maxScrollExtent &&
//         !_controller!.position.outOfRange) {
//       print('reach the bottom');
//     }
//     if (_controller!.offset <= _controller!.position.minScrollExtent &&
//         !_controller!.position.outOfRange) {
//       print('reach the top');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = ScrollController();
//     _controller!.addListener(_scrollListener);    
//   }

//   @override
//   void dispose(){
//     _controller!.dispose();
//     _controller!.removeListener(_scrollListener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const verticalDividerSpace = SizedBox(height: 12);
//     return SingleChildScrollView(
//       controller: _controller,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(widget.singleNews.newsImageUrl),
//             verticalDividerSpace,
//             verticalDividerSpace,
//             verticalDividerSpace,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 widget.singleNews.title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline2!
//                     .copyWith(fontWeight: FontWeight.w700, fontSize: 19.45),
//               ),
//             ),
//             verticalDividerSpace,
//             verticalDividerSpace,
//             newsContentHolderWidget(context, widget.singleNews.description),
//             verticalDividerSpace,
//             verticalDividerSpace,
//             Container(height: 300, color: Colors.pinkAccent),
//             verticalDividerSpace,
//             verticalDividerSpace,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 'Company Suggestions',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .copyWith(fontWeight: FontWeight.w700),
//               ),
//             ),
//             verticalDividerSpace,
//             Container(
//               height: 400,
//               color: Colors.amberAccent,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget newsContentHolderWidget(BuildContext context, String newsContent) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.90,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           newsContent,
//           style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                 color: Colors.black,
//                 height: 1.8,
//                 letterSpacing: 0.10,
//               ),
//         ),
//       ),
//       decoration: const BoxDecoration(
//         color: Colors.grey,
//         borderRadius: BorderRadius.all(
//           Radius.circular(24),
//         ),
//       ),
//     );
//   }
// }





//-------using scrollnotification
/*

import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailViewScreen extends StatefulWidget {
  const NewsDetailViewScreen({Key? key, required this.singleNews})
      : super(key: key);
  final NewsModel singleNews;

  @override
  State<NewsDetailViewScreen> createState() => _NewsDetailViewScreenState();
}

class _NewsDetailViewScreenState extends State<NewsDetailViewScreen> {
  final String route = '/news_detail_view_screen';

  @override
  Widget build(BuildContext context) {
    const verticalDividerSpace = SizedBox(height: 12);
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        // String scrollState = '';
        if (scrollNotification is ScrollStartNotification) {
          print('scroll starts');
          // setState(() {
          //   scrollState = 'scroll starts';
          // });
        } else if (scrollNotification is ScrollUpdateNotification) {
          print('scroll is updateing');
        } else if (scrollNotification is ScrollEndNotification) {
          print('scroll ends');
        }
        return false;
      },
      child: SingleChildScrollView(
        // controller: _controller,
        child: Padding(
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
              )
            ],
          ),
        ),
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

*/


//final working code:

/*
import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetailViewScreen extends StatefulWidget {
  NewsDetailViewScreen(
      {Key? key,
      required this.singleNews,
      this.onViewPortFactorChanged,
      })
      : super(key: key);
  final NewsModel singleNews;
  Function(double)? onViewPortFactorChanged;
  // double? viewportFactor;

  @override
  State<NewsDetailViewScreen> createState() => _NewsDetailViewScreenState();
}

class _NewsDetailViewScreenState extends State<NewsDetailViewScreen> {
  final String route = '/news_detail_view_screen';

  ScrollController? _controller;
  // int isTopVisited = 0;
  // int isBottomVisited = 0;

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
    // if (_controller!.offset >= _controller!.position.minScrollExtent) {
    //   print(_controller!.offset);
    //   setState(() {
    //    viewportFactor = 1.0;
    //   });
    // }
    if (_controller!.offset >= 20.0) {
      widget.onViewPortFactorChanged!(1.0);
      // print(widget.viewportFactor);
      // print(_controller!.offset);
      // setState(() {
      //   widget.viewportFactor = 1.0;
      // });
      //viewport set to 1.0
    } else {
      widget.onViewPortFactorChanged!(0.90);
      // print(widget.viewportFactor);
      // print(_controller!.offset);
      // setState(() {
      //   widget.viewportFactor = 0.90;
      // });
      //viewport set to 0.90
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


// class NewsDetailViewScreen extends StatelessWidget {
//   const NewsDetailViewScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
// return SingleChildScrollView(
//       controller: _controller,
//       child: abc(),
//     );
//   }
//     Widget abc() {
//     const verticalDividerSpace = SizedBox(height: 12);
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(widget.singleNews.newsImageUrl),
//           verticalDividerSpace,
//           verticalDividerSpace,
//           verticalDividerSpace,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               widget.singleNews.title,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline2!
//                   .copyWith(fontWeight: FontWeight.w700, fontSize: 19.45),
//             ),
//           ),
//           verticalDividerSpace,
//           verticalDividerSpace,
//           newsContentHolderWidget(context, widget.singleNews.description),
//           verticalDividerSpace,
//           verticalDividerSpace,
//           Container(height: 300, color: Colors.pinkAccent),
//           verticalDividerSpace,
//           verticalDividerSpace,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               'Company Suggestions',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(fontWeight: FontWeight.w700),
//             ),
//           ),
//           verticalDividerSpace,
//           Container(
//             height: 400,
//             color: Colors.amberAccent,
//           )
//         ],
//       ),
//     );
//   }

//     Widget newsContentHolderWidget(BuildContext context, String newsContent) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.90,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           newsContent,
//           style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                 color: Colors.black,
//                 height: 1.8,
//                 letterSpacing: 0.10,
//               ),
//         ),
//       ),
//       decoration: const BoxDecoration(
//         color: Colors.grey,
//         borderRadius: BorderRadius.all(
//           Radius.circular(24),
//         ),
//       ),
//     );
//   }
// }
*/