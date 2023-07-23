class AddFromExistRequest {
  final List<String> productIds;
  final String categoryId;

  AddFromExistRequest({
    required this.productIds,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() => {
        "product_ids": productIds,
        "category_id": categoryId,
      };
}
