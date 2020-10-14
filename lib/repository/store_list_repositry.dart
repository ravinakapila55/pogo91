import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pogo91/di/injection.dart';
import 'package:pogo91/model/store_model.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/util/api_endpoint.dart';
import 'package:pogo91/util/request_exception.dart';

abstract class StoreListRepositry {
  Future<List<StoreModel>> fetchStoreList(String businessID);
}

class StoreListRepositryImpl implements StoreListRepositry {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<StoreModel>> fetchStoreList(String businessID) async {
    final response = await http.get(ApiEndPoint.BUSINESS_STORES + businessID);
    print(ApiEndPoint.BUSINESS_STORES + businessID);

    var statusCode = response.statusCode;
    var jsonBody = response.body;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final contactsBody = _decoder.convert(jsonBody);
    final List contacts = contactsBody['store_details'];

    return contacts.map((stores) => new StoreModel.fromMap(stores)).toList();
  }
}
