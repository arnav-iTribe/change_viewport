//detail view screen
/*
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
  bool isFull = false;

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
    if (_controller!.offset >= 15.0) {
      // widget.onViewPortFactorChanged!(1.0);
      Future.delayed(const Duration(seconds: 4), () {
        print('delaynng');
        widget.onViewPortFactorChanged!(1.0);
      });
      // setState(() {
      //   isFull = true;
      // });
    } else {
      // widget.onViewPortFactorChanged!(0.90);

      Future.delayed(const Duration(seconds: 4), () {
        print('delaynng from down');
        widget.onViewPortFactorChanged!(0.90);
      });
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
    // return SingleChildScrollView(
    //     controller: _controller,
    //     child: Stack(
    //       children: [
    //         AnimatedPositioned(
    //           width: isFull
    //               ? MediaQuery.of(context).size.width
    //               : MediaQuery.of(context).size.width * 0.80,
    //           duration: const Duration(seconds: 4),
    //           curve: Curves.easeOut,
    //           child: detailViewScreenContent(),
    //         )
    //       ],
    //     )
    //     // child: abc(),
    //     );
    return SingleChildScrollView(
      controller: _controller,
      child: detailViewScreenContent(),
    );
  }

  Widget abc() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: Colors.pinkAccent,
            height: 400,
            width: 200,
          ),
          Container(
            color: Colors.greenAccent,
            height: 400,
            width: 200,
          ),
          Container(
            color: Colors.yellowAccent,
            height: 400,
            width: 200,
          ),
          Container(
            color: Colors.amberAccent,
            height: 400,
            width: 200,
          ),
        ],
      ),
    );
  }

  Widget detailViewScreenContent() {
    const verticalDividerSpace = SizedBox(height: 24);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 319,
            width: 239,
            child: Image.network(widget.singleNews.newsImageUrl),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.singleNews.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19.45),
            ),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                newsContentHolderWidget(context, widget.singleNews.description),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(height: 300, color: Colors.pinkAccent),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Company Suggestions',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              height: 400,
              color: Colors.greenAccent,
            ),
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

*/

//----------------------------------------------------------------
//carousel holder

/*
import 'dart:async';

import 'package:change_viewport_on_scroll_start/detail_view_screen.dart';
import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailViewScreenCarousel extends StatefulWidget {
  const NewsDetailViewScreenCarousel({Key? key}) : super(key: key);

  @override
  _NewsDetailViewScreenCarouselState createState() =>
      _NewsDetailViewScreenCarouselState();
}

// with SingleTickerProviderStateMixin
class _NewsDetailViewScreenCarouselState
    extends State<NewsDetailViewScreenCarousel>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;

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

  // PageController _pageController = PageController(
  //   initialPage: 0,
  //   viewportFraction: 0.90,
  //   keepPage: true,
  // );

  ScrollController? _scrollController;
  AnimationController? _animationController;

  bool isFull = false;
  bool fullScreen = false;
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
    if (_scrollController!.offset >= 15.0) {
      // widget.onViewPortFactorChanged!(1.0);
      setState(() {
        isFull = true;
      });
    } else {
      // widget.onViewPortFactorChanged!(0.90);
      {
        isFull = false;
      }
    }
  }

  var factor = 0.90;
  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   duration: const Duration(seconds: 10),
    //   vsync: this,
    // )..repeat();

    // _scrollController = ScrollController();
    // _scrollController!.addListener(_scrollListener);

    // if (fullScreen) {
    //   print('full');
    //   Future.delayed(const Duration(seconds: 2), () {
    //     factor = 1.0;
    //   });
    // }
  }

  @override
  void dispose() {
    // _scrollController!.dispose();
    super.dispose();
  }

  // bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView.builder(
            reverse: true,
            // controller: _pageController,
            controller: PageController(
              initialPage: 0,
              keepPage: false,
              // viewportFraction: factor,
              viewportFraction: fullScreen? 1.0 : 0.90,
            ),
            itemBuilder: (context, i) {
              return Opacity(
                opacity: _currentPage == i ? 1.0 : 0.8,
                // child: AnimatedPositioned(
                //   width: fullScreen
                //       ? MediaQuery.of(context).size.width
                //       : MediaQuery.of(context).size.width * 0.60,
                //   duration: const Duration(seconds: 4),
                //   curve: Curves.easeOut,
                //   child: NewsDetailViewScreen(
                //     singleNews: news[i],
                //     onViewPortFactorChanged: (double val) {
                //       setState(() {
                //         fullScreen = val == 1.0 ? true : false;
                //       });
                //     },
                //   ),
                // ),
                child: NewsDetailViewScreen(
                  singleNews: news[i],
                  onViewPortFactorChanged: (double val) {
                    print('vp changed');
                    print(val);
                    setState(() {
                      fullScreen = val == 1.0 ? true : false;
                    });
                  },
                ),
                // child: _carouselBuilder(i, _animationController!, news[i]),
              );
            },
            itemCount: news.length,
            onPageChanged: (i) {
              setState(() {
                _currentPage = i;
              });
              print(_currentPage);
            },
          ),
        ],
      )),
    );
  }

  // Widget _carouselBuilder(
  //     int index, AnimationController _animationController, singleNews) {
  //   return AnimatedBuilder(
  //     animation: _animationController,
  //     // child: Container(height: 100, color: Colors.black, width: 300),
  //     builder: (context, _) {
  //       double value = 1.0;
  //       // if (_animationController.position.haveDimensions) {
  //       //   value = _animationController.page! - index;
  //       //   value = (1 - (value.abs() * .30)).clamp(0.0, 1.0);
  //       // }
  //       return GestureDetector(
  //         onTap: () {
  //           tapped = true;
  //           print('tapped');
  //           // Curves.elasticOut;
  //           Future.delayed(const Duration(seconds: 3), () {
  //             tapped = false;
  //           });
  //         },
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: AnimatedContainer(
  //             color: Colors.pinkAccent,
  //             width: tapped ? 300.0 : 100.0,
  //             // height: tapped ? 50.0 : 100.0,
  //             height: Curves.bounceInOut.transform(value) * 120,
  //             alignment:
  //                 tapped ? Alignment.center : AlignmentDirectional.topCenter,
  //             duration: Duration(seconds: 2),
  //             curve: Curves.easeInCubic,
  //             child: Text('$index'),
  //           ),
  //         ),
  //         // child: Center(
  //         //   child: Padding(
  //         //     padding: const EdgeInsets.all(8.0),
  //         //     child: Container(
  //         //       color: Colors.amberAccent,
  //         //       // height: 100,
  //         //       height: Curves.bounceInOut.transform(value) * 120,
  //         //       width: 300,
  //         //       child: Text('$index'),
  //         //     ),
  //         //   ),
  //         // ),
  //       );
  //       // return SingleChildScrollView(
  //       //   // controller: _scrollController,
  //       //   child: detailViewScreenContent(singleNews),
  //       // );
  //     },
  //   );
  // }

  Widget detailViewScreenContent(singleNews) {
    const verticalDividerSpace = SizedBox(height: 24);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 319,
            width: 239,
            child: Image.network(singleNews.newsImageUrl),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              singleNews.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 19.45),
            ),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.all(12),
            child: newsContentHolderWidget(context, singleNews.description),
          ),
          verticalDividerSpace,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(height: 300, color: Colors.pinkAccent),
          ),
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 400,
              color: Colors.greenAccent,
            ),
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

*/

//--animation test --
/*

// class AnimationTest extends StatefulWidget {
//   const AnimationTest({Key? key}) : super(key: key);

//   @override
//   AnimationTestState createState() => AnimationTestState();
// }

// class AnimationTestState extends State<AnimationTest> {
//   PageController _controller =
//       PageController(initialPage: 0, keepPage: true, viewportFraction: 0.98);

//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       int next = _controller.page!.round();
//       if (currentPage != next) {
//         setState(() {
//           currentPage = next;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo,
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: const Icon(
//           Icons.star,
//           color: Colors.yellow,
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             // color: Colors.pink,
//             child: const Text(
//               'Home',
//               style: TextStyle(color: Colors.yellow),
//             ),
//             onPressed: () {
//               _controller.jumpToPage(0);
//             },
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 _controller.jumpToPage(1);
//               },
//               child: const Text('About')),
//           ElevatedButton(
//               onPressed: () {
//                 _controller.jumpToPage(2);
//               },
//               child: const Text('Solutions')),
//           ElevatedButton(
//               onPressed: () {
//                 _controller.jumpToPage(3);
//               },
//               child: const Text('Why')),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: PageView(
//           controller: _controller,
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             //page 1
//             _buildHome(),
//             _buildAboutUs(),
//             _buildSolutions(),
//             _buildWhyChooseUs()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHome() {
//     bool active = currentPage == 0 ? true : false;
//     print('home active $active');
//     double margin = active ? 40.0 : 120;
//     var color = active ? Colors.indigo : Colors.red;

//     return AnimatedContainer(
//       duration: const Duration(seconds: 3),
//       margin: EdgeInsets.fromLTRB(margin, 16.0, margin, 16.0),
//       curve: Curves.easeIn,
//       decoration: BoxDecoration(color: color),
//       child: const Center(
//         child: Text('Home'),
//       ),
//     );
//   }

//   //this is about us page
//   Widget _buildAboutUs() {
//     bool active = currentPage == 1 ? true : false;
//     print('about us active $active');
//     double margin = active ? 40.0 : 120;
//     var color = active ? Colors.indigo : Colors.red;

//     return AnimatedContainer(
//       duration: const Duration(seconds: 3),
//       margin: EdgeInsets.fromLTRB(margin, 16.0, margin, 16.0),
//       curve: Curves.easeIn,
//       decoration: BoxDecoration(color: color),
//       child: const Center(
//         child: Text('about us'),
//       ),
//     );
//   }

//   //this is solutions page
//   Widget _buildSolutions() {
//     bool active = currentPage == 2 ? true : false;
//     print('solutions active $active');

//     double margin = active ? 40.0 : 120;
//     var color = active ? Colors.indigo : Colors.red;

//     return AnimatedContainer(
//       duration: const Duration(seconds: 3),
//       margin: EdgeInsets.fromLTRB(margin, 16.0, margin, 16.0),
//       curve: Curves.easeIn,
//       decoration: BoxDecoration(color: color),
//       child: Center(
//         child: Text('solutions'),
//       ),
//     );
//   }

//   //this is why choose us page
//   Widget _buildWhyChooseUs() {
//     bool active = currentPage == 3 ? true : false;
//     print('why choose us active $active');

//     double margin = active ? 40.0 : 120;
//     var color = active ? Colors.indigo : Colors.red;

//     return AnimatedContainer(
//       duration: const Duration(seconds: 3),
//       margin: EdgeInsets.fromLTRB(margin, 16.0, margin, 16.0),
//       curve: Curves.easeIn,
//       decoration: BoxDecoration(color: color),
//       child: const Center(
//         child: Text('why choose us'),
//       ),
//     );
//   }
// }
*/