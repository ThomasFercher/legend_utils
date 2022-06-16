import 'package:flutter/widgets.dart';

extension LegendEdgeInset on double {
  ///
  /// Returns EdgeInset with all edges set to this value. If any of the
  /// parameters is set to false it will be 0.
  /// Usecase: You want only want to set one side to a value and all other to the same.
  ///
  ///
  EdgeInsets asPaddingAllBut(
    double value, {
    bool top = false,
    bool left = false,
    bool bottom = false,
    bool right = false,
  }) {
    return EdgeInsets.only(
      top: top ? value : this,
      left: left ? value : this,
      bottom: bottom ? value : this,
      right: right ? value : this,
    );
  }
}
