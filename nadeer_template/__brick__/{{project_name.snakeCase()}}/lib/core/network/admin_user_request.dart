class AdminUserRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? role;
  String? districtId;

  AdminUserRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.districtId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    if (password != null) {
      data['password'] = password;
    }
    if (role != null && role!.toLowerCase() == 'driver') {
      data['district'] = districtId;
    }
    data['phone'] = phone;
    data['role'] = role;
    return data;
  }
}

class UpdateAdminUserRequest {
  late final String userId;
  late final AdminUserRequest adminUserRequest;

  UpdateAdminUserRequest({
    required this.userId,
    required this.adminUserRequest,
  });
}
