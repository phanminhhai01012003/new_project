import 'package:flutter/material.dart';
import 'package:new_project/screen/exercise/lev1/e1.dart';
import 'package:new_project/screen/exercise/lev1/e10.dart';
import 'package:new_project/screen/exercise/lev1/e2.dart';
import 'package:new_project/screen/exercise/lev1/e3.dart';
import 'package:new_project/screen/exercise/lev1/e4.dart';
import 'package:new_project/screen/exercise/lev1/e5.dart';
import 'package:new_project/screen/exercise/lev1/e6.dart';
import 'package:new_project/screen/exercise/lev1/e7.dart';
import 'package:new_project/screen/exercise/lev1/e8.dart';
import 'package:new_project/screen/exercise/lev1/e9.dart';
import 'package:new_project/screen/exercise/lev2/e11.dart';
import 'package:new_project/screen/exercise/lev2/e12.dart';
import 'package:new_project/screen/exercise/lev2/e13.dart';
import 'package:new_project/screen/exercise/lev2/e14.dart';
import 'package:new_project/screen/exercise/lev2/e15.dart';
import 'package:new_project/screen/exercise/lev3/e16.dart';
import 'package:new_project/screen/exercise/lev3/e17.dart';
import 'package:new_project/screen/exercise/lev3/e18.dart';
import 'package:new_project/screen/exercise/lev3/e19.dart';
import 'package:new_project/screen/exercise/lev3/e20.dart';
import 'package:new_project/screen/exercise/lev3/e21.dart';
import 'package:new_project/screen/exercise/lev3/e22.dart';
import 'package:new_project/screen/exercise/lev3/e23.dart';
import 'package:new_project/screen/exercise/lev3/e24.dart';
import 'package:new_project/screen/exercise/lev3/e25.dart';
import 'package:new_project/screen/exercise/lev4/e26.dart';
import 'package:new_project/screen/exercise/lev4/e27.dart';
import 'package:new_project/screen/exercise/lev4/e28.dart';
import 'package:new_project/screen/exercise/lev4/e29.dart';
import 'package:new_project/screen/exercise/lev4/e30.dart';
import 'package:new_project/screen/exercise/lev4/e31.dart';
import 'package:new_project/screen/exercise/lev4/e32.dart';
import 'package:new_project/screen/exercise/lev4/e33.dart';
import 'package:new_project/screen/exercise/lev4/e34.dart';
import 'package:new_project/screen/exercise/lev4/e35.dart';
import 'package:new_project/screen/exercise/lev5/e36.dart';
import 'package:new_project/screen/exercise/lev5/e38.dart';
import 'package:new_project/screen/exercise/lev5/e39.dart';
import 'package:new_project/screen/exercise/lev5/e40.dart';
import 'package:new_project/screen/exercise/lev5/e41.dart';
import 'package:new_project/screen/exercise/lev5/e42.dart';
import 'package:new_project/screen/exercise/lev5/e43.dart';
import 'package:new_project/screen/exercise/lev5/e44.dart';
import 'package:new_project/screen/exercise/lev5/e45.dart';
import 'package:new_project/screen/level/levelfive.dart';
import 'package:new_project/screen/level/levelfour.dart';
import 'package:new_project/screen/level/levelone.dart';
import 'package:new_project/screen/level/levelthree.dart';
import 'package:new_project/screen/level/leveltwo.dart';

import '../screen/exercise/lev5/e37.dart';

class PageNavigator {
  static const List<Widget> levelNavigation = [
    Levelone(),
    Leveltwo(),
    Levelthree(),
    Levelfour(),
    Levelfive()
  ];
  static const List<Widget> level1ExercisesNavigation = [
    Exercise1(),
    Exercise2(),
    Exercise3(),
    Exercise4(),
    Exercise5(),
    Exercise6(),
    Exercise7(),
    Exercise8(),
    Exercise9(),
    Exercise10()
  ];
  static const List<Widget> level2ExercisesNavigation = [
    Exercise11(),
    Exercise12(),
    Exercise13(),
    Exercise14(),
    Exercise15(),
  ];
  static const List<Widget> level3ExerciseNavigation = [
    Exercise16(),
    Exercise17(),
    Exercise18(),
    Exercise19(),
    Exercise20(),
    Exercise21(),
    Exercise22(),
    Exercise23(),
    Exercise24(),
    Exercise25()
  ];
  static const List<Widget> level4ExerciseNavigation = [
    Exercise26(),
    Exercise27(),
    Exercise28(),
    Exercise29(),
    Exercise30(),
    Exercise31(),
    Exercise32(),
    Exercise33(),
    Exercise34(),
    Exercise35()
  ];
  static const List<Widget> level5ExerciseNavigation = [
    Exercise36(),
    Exercise37(),
    Exercise38(),
    Exercise39(),
    Exercise40(),
    Exercise41(),
    Exercise42(),
    Exercise43(),
    Exercise44(),
    Exercise45()
  ];
}