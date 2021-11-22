import 'package:change_viewport_on_scroll_start/animations/animated_container.dart';
import 'package:change_viewport_on_scroll_start/carousel_holder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const NewsDetailViewScreenCarousel(),
      home: const AnimatedContainerDemo(),
    );
  }
}
