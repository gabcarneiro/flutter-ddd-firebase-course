import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_transformers.dart';

void main() {
  test('should return the input color with value of opaticity 1', () {
    const tColor = Color.fromRGBO(255, 255, 255, 0);

    final result = makeColorOpaque(tColor);

    expect(result.opacity, equals(1));
  });
}
