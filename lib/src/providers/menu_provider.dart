import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> fetchData() async {
    final String response = await rootBundle.loadString('data/menu_opts.json');
    final Map<String, dynamic> data = await json.decode(response);

    options = data['rutas'];
    return options;
  }
}

final menuProvider = _MenuProvider();
