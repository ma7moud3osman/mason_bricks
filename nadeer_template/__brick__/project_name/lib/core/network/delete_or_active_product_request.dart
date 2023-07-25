class DeleteOrActiveProductRequest {
  final bool? isActive;
  final bool isDelete;
  final String productId;
  final String categoryId;

  DeleteOrActiveProductRequest({
    this.isActive,
    required this.isDelete,
    required this.productId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() => {
        "active": isActive,
        "isDelete": isDelete,
        "product_id": productId,
      };
}
