import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:pogo91/di/injection.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:pogo91/service/network_service.dart';
import 'package:pogo91/util/api_endpoint.dart';
import 'package:pogo91/util/request_exception.dart';

abstract class BusinessTypeRepositry {
  Future<List<BusinessType>> fetchBusinessType();

}

class BusinessTypeRepositryImpl implements BusinessTypeRepositry {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<BusinessType>> fetchBusinessType() async {
    final response = await http.get(ApiEndPoint.BUSINESS_TYPE+"");
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final contactsBody = _decoder.convert(jsonBody);
    final List contacts = contactsBody['business_type'];

    return contacts.map((contact) => new BusinessType.fromMap(contact)).toList();
  }

  


}
