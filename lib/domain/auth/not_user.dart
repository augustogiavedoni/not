import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/value_objects/unique_id.dart';

part 'not_user.freezed.dart';

@freezed
abstract class NotUser with _$NotUser {
  const factory NotUser({
    required UniqueId id,
  }) = _NotUser;
}
