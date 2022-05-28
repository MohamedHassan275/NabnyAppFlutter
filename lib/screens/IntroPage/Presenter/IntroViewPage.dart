import 'package:flutter/material.dart';
import 'package:nabny/screens/IntroPage/Widget/IntroBodyPage.dart';

import '../../../utils/Themes.dart';

class IntroViewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IntroViewPageState();
  }
  
}
class IntroViewPageState extends State<IntroViewPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: IntroBodyPage(),
    );
  }
  
}