import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullfluttersetup/features/profile/domain/entity/user.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@Freezed()
class UserModel extends User with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    @Default('') String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
