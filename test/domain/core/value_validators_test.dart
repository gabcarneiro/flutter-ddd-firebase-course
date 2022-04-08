import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_firebase_ddd_course/domain/core/failures.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_validators.dart';

void main() {
  group('validateMaxStringLength', () {
    test(
      'should return right with string input '
      'when input string lenght is lesser than maxLenght',
      () {
        final result = validateMaxStringLength('string', 7);

        expect(result, equals(const Right('string')));
      },
    );

    test(
      'should return right with string input '
      'when input string lenght is equals to maxLenght',
      () {
        final result = validateMaxStringLength('string', 6);

        expect(result, equals(const Right('string')));
      },
    );

    test(
      'should return left with ExceedingLength '
      'when input string lenght is greater to maxLenght',
      () {
        final result = validateMaxStringLength('string', 5);

        expect(
          result,
          equals(
            const Left(
              ValueFailure.exceedingLength(failedValue: 'string', max: 5),
            ),
          ),
        );
      },
    );
  });
}
