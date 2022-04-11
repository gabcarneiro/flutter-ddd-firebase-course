import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_firebase_ddd_course/domain/core/failures.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_validators.dart';

void main() {
  group('validateMaxStringLength', () {
    test(
      'should return [Right] with value of input '
      'when input string lenght is lesser than maxLenght',
      () {
        final result = validateMaxStringLength('string', 7);

        expect(result, equals(const Right('string')));
      },
    );

    test(
      'should return [Right] with value of input '
      'when input string lenght is equals to maxLenght',
      () {
        final result = validateMaxStringLength('string', 6);

        expect(result, equals(const Right('string')));
      },
    );

    test(
      'should return [Left] with value of [ExceedingLength] containing '
      'the failed value '
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

  group('validateStringNotEmpty', () {
    test(
        'should return [Right] with value of input '
        'when input string is NOT empty', () {
      final result = validateStringNotEmpty('not empty');

      expect(result, equals(const Right('not empty')));
    });

    test(
      'should return [Left] with value of [Empty] containing the failed value '
      'when input string is empty',
      () {
        final result = validateStringNotEmpty('');

        expect(
          result,
          equals(const Left(Empty(failedValue: ''))),
        );
      },
    );
  });
}
