import '../../../../core/utils/app_enums.dart';

abstract class User {
  late final String sId;
  late final String firstName;
  late final String lastName;
  late final String? profileImageUri;
  late final String? email;
  late final String? profileId;
  late final String? phone;
  late final String? birthDate;
  late final bool active;
  late final Roles role;
  late final String? token;
  late final LoginFromType loginFromType;
  late final double? balance;
  late final String? walletId;

  late final String? regionId;
  late final String? stateId;
  late final String? districtId;

  User({
    required this.sId,
    required this.firstName,
    required this.lastName,
    this.profileImageUri,
    this.email,
    this.profileId,
    this.phone,
    this.birthDate,
    required this.active,
    required this.role,
    required this.loginFromType,
    this.balance,
    this.walletId,
    this.token,
    this.regionId,
    this.stateId,
    this.districtId,
  });

  Map<String, dynamic> toJson();

  Map<String, dynamic> toSharedPrefs();

  User copyWith({
    String? firstName,
    String? lastName,
    String? profileImageUri,
    String? email,
    String? phone,
    String? birthDate,
    bool? active,
    Roles? role,
    String? token,
    double? balance,
    String? walletId,
    String? profileId,
    String? regionId,
    String? stateId,
    String? districtId,
    LoginFromType? loginFromType,
  });
}
