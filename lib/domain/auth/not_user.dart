import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/value_objects/unique_id.dart';
import 'value_objects/name.dart';

part 'not_user.freezed.dart';

@freezed
class NotUser with _$NotUser {
  const factory NotUser({
    required Name name,
    required UniqueId id,
  }) = _NotUser;
}
