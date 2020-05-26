import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:reto_1/src/models/house_model.dart';

class _HousesProvider {

  List<dynamic> houses = [];

  _HousesProvider();

  Future <List<House>> loadData() async {
    final response = await rootBundle.loadString('data/houses_data.json');
    Map dataMap = json.decode(response);
    final houses = Houses.fromJsonList(dataMap['houses']);
    return houses.items;
  } 
}

final housesProvider = _HousesProvider();