import 'dart:convert';

import 'package:pogo91/helper/config.dart';
import 'package:pogo91/model/business_type.dart';
import 'package:http/http.dart' as http;

Future<Stream<BusinessType>> getBusinessType() async {
  Uri uri = Helper.getUri('business-type/');
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) {
      print(data.toString());
      Helper.getData(data, "business_type")
          .map((data) => BusinessType.fromMap(data));
    });
  } catch (e) {
    return new Stream.value(new BusinessType.fromMap({}));
  }
}
