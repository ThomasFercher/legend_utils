import 'package:flutter/widgets.dart';

extension TextColor on Color {
  Color getTextColor({
    Color? dark,
    Color? light,
  }) {
    int d = 0;
    Color? color;

    // Counting the perceptive luminance - human eye favors green color...
    double luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;

    if (luminance > 0.5) {
      d = 0;
      color = dark;
    } else {
      d = 255;
      color = light;
    } // dark colors - white font

    return color ?? Color.fromARGB(alpha, d, d, d);
  }
}
