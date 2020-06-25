library color_constants;

import 'dart:ui';

import 'package:flutter/material.dart';

const Color blueDark = Color.fromRGBO(0, 0, 68, 1.0);
const Color blueLight = Color.fromRGBO(129, 204, 204, 1.0);
const Color greyDark = Color.fromRGBO(102, 102, 102, 1.0);
const Color grey = Color.fromRGBO(230, 230, 230, 1.0);
const Color white = Color.fromRGBO(255, 255, 255, 1.0);

const Color blueNight = Color.fromRGBO(0, 35, 78, 1.0);
const Color blueDay = Color.fromRGBO(53, 205, 255, 1.0);
const Color brownLand = Color.fromRGBO(114, 76, 51, 1.0);
const Color greenLand = Color.fromRGBO(0, 190, 122, 1.0);
const Color greenPlant = Color.fromRGBO(0, 180, 114, 1.0);

const op = 1.0;
const List<Gradient> sky = [
  // 00
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(14, 14, 22, op), Color.fromRGBO(14, 14, 22, op)],
  ),
  // 01
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(15, 15, 26, op), Color.fromRGBO(29, 27, 35, op)],
  ),
  // 02
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(15, 15, 26, op), Color.fromRGBO(35, 34, 43, op)],
  ),
  // 03
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(15, 15, 26, op), Color.fromRGBO(53, 53, 70, op)],
  ),
  // 04
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(37, 37, 45, op), Color.fromRGBO(69, 69, 94, op)],
  ),
  // 05
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(59, 59, 80, op), Color.fromRGBO(107, 96, 133, op)],
  ),
  // 06
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(67, 66, 89, op), Color.fromRGBO(153, 104, 126, op)],
  ),
  // 07
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(96, 99, 147, op),
      Color.fromRGBO(170, 133, 158, op)
    ],
  ),
  // 08
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(107, 135, 166, op),
      Color.fromRGBO(175, 138, 139, op)
    ],
  ),
  // 09
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(117, 152, 187, op),
      Color.fromRGBO(136, 145, 179, op)
    ],
  ),
  // 10
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(141, 177, 192, op),
      Color.fromRGBO(118, 170, 192, op)
    ],
  ),
  // 11
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(121, 172, 191, op),
      Color.fromRGBO(87, 161, 189, op)
    ],
  ),
  // 12
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(113, 168, 191, op),
      Color.fromRGBO(55, 129, 161, op)
    ],
  ),
  // 13
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(74, 147, 177, op), Color.fromRGBO(40, 93, 132, op)],
  ),
  // 14
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(45, 115, 149, op), Color.fromRGBO(35, 73, 114, op)],
  ),
  // 15
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(38, 94, 133, op), Color.fromRGBO(73, 96, 106, op)],
  ),
  // 16
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(35, 71, 112, op), Color.fromRGBO(118, 126, 94, op)],
  ),
  // 17
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(38, 73, 112, op), Color.fromRGBO(170, 154, 80, op)],
  ),
  // 18
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(33, 63, 96, op), Color.fromRGBO(141, 89, 56, op)],
  ),
  // 19
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(32, 57, 71, op), Color.fromRGBO(62, 32, 20, op)],
  ),
  // 20
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(19, 33, 41, op), Color.fromRGBO(50, 29, 17, op)],
  ),
  // 21
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(15, 21, 25, op), Color.fromRGBO(52, 28, 19, op)],
  ),
  // 22
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(20, 17, 15, op), Color.fromRGBO(63, 33, 18, op)],
  ),
  // 23
  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(14, 14, 22, op), Color.fromRGBO(26, 19, 15, op)],
  ),
];

Color getLuminanceOpposite(Color btnBgColor) {
  double luminance = btnBgColor.computeLuminance();
  if (luminance > 0.5) return Colors.black;
  return Colors.white;
}

Color invertColor(Color color) {
  return Color.fromRGBO(
      255 - color.red, 255 - color.green, 255 - color.blue, 1);
}

Color darkenColor(Color color) {
  HSLColor hsl = HSLColor.fromColor(color);
  HSLColor darker = HSLColor.fromAHSL(
      hsl.alpha, hsl.hue, hsl.saturation, hsl.lightness - 0.1);

  return darker.toColor();
}

Color lightenColor(Color color) {
  HSLColor hsl = HSLColor.fromColor(color);
  HSLColor lighter = HSLColor.fromAHSL(
      hsl.alpha, hsl.hue, hsl.saturation, hsl.lightness + 0.1);

  return lighter.toColor();
}

Color getLighterColor(List<Color> colors) {
  Color lighterColor;
  for (Color color in colors) {
    if (lighterColor == null) {
      lighterColor = color;
    } else {
      lighterColor = lighterColor.computeLuminance() > color.computeLuminance()
          ? lighterColor
          : color;
    }
  }
  return lighterColor;
}

Color getLuminanceDeltaColor(Color color) {
  double luminanceDelta = 0.15;
  HSVColor hsvRef = HSVColor.fromColor(color);
  Color newColor;
  if (color.computeLuminance() > 0.5) {
    newColor = hsvRef.withValue(hsvRef.value - luminanceDelta).toColor();
  }
  newColor = hsvRef.withValue(hsvRef.value + luminanceDelta).toColor();

  return newColor;
}
