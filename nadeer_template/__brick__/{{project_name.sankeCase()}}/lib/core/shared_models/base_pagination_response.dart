abstract class BasePaginationResponse<T> {
  List<T> docs;
  late final int totalDocs;
  late final int limit;
  late final bool hasPrevPage;
  late final bool hasNextPage;
  late final int page;
  late final int totalPages;
  late final int? prevPage;
  late final int? nextPage;
  late final int pagingCounter;

  BasePaginationResponse({
    required this.totalDocs,
    required this.docs,
    required this.limit,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.page,
    required this.totalPages,
    this.prevPage,
    this.nextPage,
    required this.pagingCounter,
  });
}
