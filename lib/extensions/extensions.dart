import 'package:flutter/material.dart';

extension ExpandWidget on Widget {
  Widget expandIf(bool expand) {
    if (expand) {
      return Expanded(child: this);
    } else {
      return this;
    }
  }
}

extension NullInit on dynamic {
  T? boolInit<T>(bool condition) {
    return condition ? this as T : null;
  }
}

enum LegendRadiusType {
  all,
  vertical,
  horizontal,
}

extension LegendRadius on double {
  BorderRadius asRadius({LegendRadiusType type = LegendRadiusType.all}) {
    switch (type) {
      case LegendRadiusType.all:
        return BorderRadius.all(Radius.circular(this));
      case LegendRadiusType.vertical:
        return BorderRadius.vertical(
            top: Radius.circular(this), bottom: Radius.circular(this));
      case LegendRadiusType.horizontal:
        return BorderRadius.horizontal(
            left: Radius.circular(this), right: Radius.circular(this));
    }
  }
}

extension ListPadding on List<Widget> {
  List<Widget> traillingPaddingRow(double padding, {bool last = false}) {
    List<Widget> layout = [];
    for (var i = 0; i < length; i++) {
      layout.add(this[i]);
      if (!(i == length - 1) || last) {
        layout.add(SizedBox(width: padding));
      }
    }
    return layout;
  }

  List<Widget> paddingAround(double padding) {
    List<Widget> layout = [];
    for (var i = 0; i < length; i++) {
      layout.add(SizedBox(width: padding));
      layout.add(this[i]);
    }
    layout.add(SizedBox(width: padding));
    return layout;
  }

  List<Widget> traillingPaddingCol(double padding, {bool last = false}) {
    List<Widget> layout = [];
    for (var i = 0; i < length; i++) {
      layout.add(this[i]);
      if (!(i == length - 1) || last) {
        layout.add(SizedBox(height: padding));
      }
    }
    return layout;
  }
}

extension HttpParameter on dynamic {
  String asHttpParameter(
    String s, {
    bool first = false,
  }) {
    return first ? '?$s=$this' : '&$s=$this';
  }
}

extension BoolFunctions on Function? {
  void executeIf(bool val) => val ? this?.call() : null;
}

extension ColorManipulation on Color? {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this ?? Colors.transparent);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this ?? Colors.transparent);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
