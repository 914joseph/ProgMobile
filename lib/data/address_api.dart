import 'dart:convert';

import 'package:progmobile/domain/address.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddressApi {
  final String _baseUrl = "viacep.com.br";

  findAddressByCep(String cep) async {
    Uri url = Uri.http(_baseUrl, "/ws/$cep/json/");
    Response response = await http.get(url);
    var json = jsonDecode(response.body);

    if (json["error"] != null) {
      return Address();
    }

    return Address.fromJson(json);
  }
}