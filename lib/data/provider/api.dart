import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const KUrlApi = "https://api.hgbrasil.com/finance?format=json&key=b870a0bf";

class Api {
  Future<dynamic> ApiResponse() async {
    http.Response response;
    response = await http.get(KUrlApi);

    return convert.json.decode(response.body);
  }
}
