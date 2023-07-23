class AddressRequest {
  final bool isDefault;
  final String type;
  final String location;
  final String region;
  final String state;
  final String street;
  final String district;
  final String postalCode;
  final String buildingNumber;

  AddressRequest({
    required this.isDefault,
    required this.type,
    required this.location,
    required this.region,
    required this.state,
    required this.street,
    required this.district,
    required this.postalCode,
    required this.buildingNumber,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['isDefault'] = isDefault;
    map['type'] = type;
    map['location'] = location;
    map['region'] = region;
    map['state'] = state;
    map['street'] = street;
    map['district'] = district;
    map['region'] = region;
    map['region'] = district;
    map['district'] = district;
    map['postal_code'] = postalCode;
    map['building_number'] = buildingNumber;

    return map;
  }
}

class UpdateAddressRequest {
  final String addressId;
  final AddressRequest addressRequest;

  UpdateAddressRequest({
    required this.addressId,
    required this.addressRequest,
  });
}
