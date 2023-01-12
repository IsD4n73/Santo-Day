import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:santo_day/model/santo_model.dart';

String url = "https://www.santodelgiorno.it/santi.json?data=";

String noImg =
    "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg";

Future<List<SantoModel>> fetchSanto(String date) async {
  final response = await http.get(Uri.parse(url + date));


  print("$url$date");

  if (response.statusCode == 200) {
    List<SantoModel> list = [];
    List result = jsonDecode(response.body);
    for (var santo in result) {
      list.add(SantoModel.fromJson(santo));
    }
    return list;
  } else {
    throw Exception('Failed to load API');
  }
}
