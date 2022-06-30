import 'dart:ui';

import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/value_object.dart';
import '../../core/value_transformers.dart';

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0XFFFAFAFA), // canvas
    Color(0XFFFA8072), // salmon
    Color(0XFFFEDC56), // mustard
    Color(0XFFD0F0C0), // tea
    Color(0XFFFCA3B7), // flamingo
    Color(0XFF997950), // tortilla
    Color(0XFFFFFDD0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  static const maxLength = 30;

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}
