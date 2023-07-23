class FavoriteRequest {
  late final String productId;

  FavoriteRequest({required this.productId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    return data;
  }
}

// class UpdateFavoriteRequest {
//   late final String id;
//   late final String status;
//
//   UpdateFavoriteRequest({
//     required this.id,
//     required this.status,
//   });
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//
//     return data;
//   }
// }
