import 'package:flutter/material.dart';

extension BuildRoute on BuildContext {
  nextPage(Widget page, {Object? arguments}) {
    Navigator.push(
        this,
        MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(arguments: arguments)));
  }

  back() {
    Navigator.pop(this);
  }
}
