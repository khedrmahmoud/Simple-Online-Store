import 'dart:async';

import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:online_store/medules/logineScreen.dart';
import 'package:online_store/shared/components/components.dart';

class InitialPage extends StatefulWidget {
  String id = 'id';
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<Color> color = [
    Colors.white,
    Colors.teal,
    Colors.green,
  ];
  List<String> images = [
    'assets/images/img.png',
    'assets/images/img_1.png',
    'assets/images/img_2.png'
  ];
  PageController controler = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConcentricPageView(
      pageController: controler,
      colors: color,
      itemCount: 3,
      //duration: Duration(milliseconds: 100),
      onFinish: () {
        navigatto(context, Login());
      },
      physics: BouncingScrollPhysics(),
      itemBuilder: (int index, double value) {
        return Container(
          child: Image.asset(images[index]),
        );
      },
    );
  }
}
