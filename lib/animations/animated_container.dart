import 'package:flutter/material.dart';
import 'anim_curves.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  AnimationCurve? dropDownValue;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer Demo"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownMenu(context),
                playAnimation(context),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              dropDownValue != null
                  ? Text(
                      dropDownValue!.curveCubic.toString(),
                    )
                  : Text(Curves.linear.toString()),
              const SizedBox(
                height: 20,
              ),
              dropDownValue != null
                  ? Text(
                      dropDownValue!.description.toString(),
                    )
                  : const Text("linear"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          animatedContainer(context),
        ],
      ),
    );
  }

  Widget animatedContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 400.0 : 200.0,
        height: selected ? 200.0 : 400.0,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 4),
        curve: Curves.elasticIn,
        child: Image.network('https://images.pexels.com/photos/2567011/pexels-photo-2567011.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400'),
      ),
    );
  }

  Widget dropDownMenu(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      child: DropdownButton<AnimationCurve>(
        value: dropDownValue == null ? curveOptions[0] : dropDownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.blueAccent),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (AnimationCurve? newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: curveOptions
            .map<DropdownMenuItem<AnimationCurve>>((AnimationCurve value) {
          return DropdownMenuItem<AnimationCurve>(
            value: value,
            child: Text(value.curveName.toString()),
          );
        }).toList(),
      ),
    );
  }

  Widget playAnimation(BuildContext context) {
    return ElevatedButton(
      // color: Colors.blueAccent,
      child: const Text("Animate"),
      onPressed: () => setState(() {
        selected = !selected;
      }),
    );
  }
}