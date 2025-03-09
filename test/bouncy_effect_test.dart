import 'package:bouncy_effect/bouncy_effect.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BouncyEffect widget should render correctly', () {
    BouncyEffect(
      onTap: () {},
      child: Container(width: 100, height: 100, color: Colors.blue));
  });
}
