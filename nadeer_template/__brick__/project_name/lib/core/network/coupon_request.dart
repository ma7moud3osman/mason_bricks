class CouponRequest {
  late final String code;
  late final String description;
  late final String discountType;
  late final double discountAmount;
  late final String expirationDate;
  late final String? ownerName;
  late final int? maxUse;
  late final bool? isActive;

  CouponRequest({
    required this.code,
    required this.description,
    required this.discountType,
    required this.discountAmount,
    required this.expirationDate,
    this.ownerName,
    this.maxUse,
    this.isActive,
  });

  CouponRequest.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    discountType = json['discountType'];
    discountAmount = json['discountAmount'];
    expirationDate = json['expirationDate'];
    expirationDate = json['ownerName'];
    expirationDate = json['maxUse'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    data['discountType'] = discountType;
    data['discountAmount'] = discountAmount;
    data['expirationDate'] = expirationDate;
    if (maxUse != null) {
      data['maxUse'] = maxUse;
    }
    if (ownerName != null) {
      data['userName'] = ownerName;
    }
    data['isActive'] = isActive;
    return data;
  }
}

class UpdateCouponRequest {
  late final String couponId;
  late final CouponRequest couponRequest;

  UpdateCouponRequest({
    required this.couponId,
    required this.couponRequest,
  });
}
