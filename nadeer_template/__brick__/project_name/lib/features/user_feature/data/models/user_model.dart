import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.sId,
    required super.firstName,
    required super.lastName,
    super.profileImageUri,
    super.email,
    super.profileId,
    super.phone,
    required super.active,
    required super.role,
    required super.loginFromType,
    super.birthDate,
    super.token,
    super.balance,
    super.walletId,
    super.regionId,
    super.stateId,
    super.districtId,
  });

  @override
  Map<String, dynamic> toSharedPrefs() {
    final Map<String, dynamic> data = <String, dynamic>{};
    final Map<String, dynamic> user = <String, dynamic>{};
    user['_id'] = sId;
    user['firstName'] = firstName;
    user['lastName'] = lastName;
    user['profile_image_uri'] = profileImageUri;
    user['email'] = email;
    user['profile_id'] = profileId;
    user['phone'] = phone;
    user['active'] = active;
    user['role'] = role.getStringRole;
    user['birth_date'] = birthDate;
    data["user"] = user;
    data["loginFrom"] = loginFromType.getStringLoginFromType;
    data['token'] = token;
    return data;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['profile_image_uri'] = profileImageUri;
    data['email'] = email;
    data['profile_id'] = profileId;
    data['phone'] = phone;
    data['active'] = active;
    data['role'] = role.getStringRole;
    data['loginFrom'] = loginFromType.getStringLoginFromType;
    data['birth_date'] = birthDate;
    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json, {String? token}) {
    return UserModel(
      token: token ?? json['token'],
      role: json['user']['role'].toString().getRole,
      sId: json['user']['_id'],
      firstName: json['user']['firstName'] ?? '',
      lastName: json['user']['lastName'] ?? '',
      profileImageUri: json['user']['profile_image_uri'],
      email: json['user']['email'] ?? "",
      profileId: json['user']['profile_id'],
      phone: json['user']['phone'],
      active: json['user']['active'],
      birthDate: json['user']['birth_date'],
      balance: json['user']['balance']?.toDouble(),
      walletId: json['user']['wallet_id'],
      loginFromType: json['user']['loginFrom'].toString().getLoginType,
      districtId: json['user']['district'] is String
          ? null
          : json['user']['district']?["_id"],
      stateId: json['user']['district'] is String
          ? null
          : json['user']['district']?['state']?["_id"],
      regionId: json['user']['district'] is String
          ? null
          : json['user']['district']?['state']?['region']?["_id"],
    );
  }

  factory UserModel.fromProfile(Map<String, dynamic> json, {String? token}) {
    return UserModel(
      token: token,
      role: json['role'].toString().getRole,
      sId: json['_id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profileImageUri: json['profile_image_uri'],
      email: json['email'] ?? "",
      profileId: json['profile_id'],
      phone: json['phone'],
      active: json['active'],
      birthDate: json['birth_date'],
      walletId: json['wallet_id'],
      balance: json['balance']?.toDouble(),
      loginFromType: json['loginFrom'].toString().getLoginType,
      districtId: json['district'] is String ? null : json['district']?["_id"],
      stateId: json['district'] is String
          ? null
          : json['district']?['state']?["_id"],
      regionId: json['district'] is String
          ? null
          : json['district']?['state']?['region']?["_id"],
    );
  }

  @override
  User copyWith({
    String? firstName,
    String? lastName,
    String? profileImageUri,
    String? email,
    String? phone,
    String? birthDate,
    bool? active,
    Roles? role,
    LoginFromType? loginFromType,
    String? token,
    double? balance,
    String? walletId,
    String? profileId,
    String? regionId,
    String? stateId,
    String? districtId,
  }) {
    return UserModel(
      sId: sId,
      email: email ?? this.email,
      active: active ?? this.active,
      role: role ?? this.role,
      birthDate: birthDate ?? this.birthDate,
      phone: phone ?? this.phone,
      lastName: lastName ?? this.lastName,
      token: token ?? this.token,
      firstName: firstName ?? this.firstName,
      profileImageUri: profileImageUri ?? this.profileImageUri,
      balance: balance ?? this.balance,
      walletId: walletId ?? this.walletId,
      profileId: profileId ?? this.profileId,
      loginFromType: loginFromType ?? this.loginFromType,
      regionId: regionId ?? this.regionId,
      stateId: stateId ?? this.stateId,
      districtId: districtId ?? this.districtId,
    );
  }
}
