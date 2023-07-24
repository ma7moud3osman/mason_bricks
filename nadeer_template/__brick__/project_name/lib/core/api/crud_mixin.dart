import '../app/injection_container.dart';
import 'api_consumer.dart';

mixin CrudMixinRemoteDateSource<Out> {
  Future<List<Out>> getAll(
      String endPoints, Out Function(Map<String, dynamic> json) fromJson,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await instance<ApiConsumer>().get(
      endPoints,
      queryParameters: queryParameters,
    );
    final List<Out> itemList = <Out>[];
    response.forEach((regionItem) {
      itemList.add(fromJson(regionItem));
    });
    return itemList;
  }

  Future<Out> getSingle(
    String endPoints,
    Out Function(Map<String, dynamic> json) fromJson,
  ) async {
    final response = await instance<ApiConsumer>().get(
      endPoints,
    );
    final Out item = fromJson(response);
    return item;
  }

  Future<Out> createSingle(
    String endPoints,
    Out Function(Map<String, dynamic> json) fromJson, {
    Map<String, dynamic>? body,
  }) async {
    final response = await instance<ApiConsumer>().post(
      endPoints,
      body: body,
    );
    final Out item = fromJson(response);
    return item;
  }

  Future<void> deleteSingle(
    String endPoints,
  ) async {
    await instance<ApiConsumer>().delete(
      endPoints,
    );
  }

  Future<Out> updateSingle(
    String endPoints,
    Out Function(Map<String, dynamic> json) fromJson, {
    Map<String, dynamic>? body,
  }) async {
    final response = await instance<ApiConsumer>().put(endPoints, body: body);
    final Out item = fromJson(response);
    return item;
  }
}
