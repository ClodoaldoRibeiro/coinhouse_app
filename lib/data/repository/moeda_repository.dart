import 'package:coinhouse_app/data/model/currencies.dart';
import 'package:coinhouse_app/data/model/currency.dart';
import 'package:coinhouse_app/data/provider/api.dart';
import 'package:coinhouse_app/data/provider/api_response.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoedaRepository {
  static Future<ApiResponse<List<Currency>>> getMoedas() async {
    http.Response response;
    try {
      //    Api api = Api();
      response = await http.get(KUrlApi);
      var data = convert.json.decode(response.body);

      List<Currency> moedas =
          Currencies.fromJson(data["results"]["currencies"]).getListCurrency();

      print("Retornou OK para a consulta...");

      return ApiResponse.ok(result: moedas);
    } catch (error, exception) {
      print("Erro Ao buscar lista de moedas $error > $exception");
      return ApiResponse.error("Erro Ao buscar lista de moedas");
    }
  }
}
