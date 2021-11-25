// import 'package:change_viewport_on_scroll_start/carousel_holder.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CarouselHolder(),
//     );

//   }
// }

//------------------------------------------------------------------
import 'dart:math';

import 'package:change_viewport_on_scroll_start/detail_view_screen.dart';
import 'package:change_viewport_on_scroll_start/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = ScrollController();

  ScrollPhysics? _physics;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension =
              _controller.position.maxScrollExtent / (news.length - 1);
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          physics: _physics,
          itemCount: news.length,
          itemBuilder: (context, i) => DetailViewScreen(
            // viewportFactor: viewportFactor,//test this
            singleNews: news[i],
            // onViewPortFactorChanged: (double val) {
            //   setState(() {
            //     // fullScreen = val == 1.0 ? true : false;
            //     factor = val;
            //   });
            // },
          ),
          // itemBuilder: (context, index) => Container(
          //   height: double.infinity,
          //   width: 300,
          //   color: randomColor,
          //   margin: const EdgeInsets.all(10.0),
          // ),
        ),
      ),
    );
  }

  Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  //added this customSpring
  // static final SpringDescription customSpring =
  //     SpringDescription.withDampingRatio(
  //   mass: 4,
  //   stiffness: 150.0,
  //   ratio: 1.8,
  // );

  const CustomScrollPhysics(
      {required this.itemDimension, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / itemDimension;
  }

  double _getPixels(double page) {
    return page * itemDimension;
  }

  double _getTargetPixels(
      dynamic position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
