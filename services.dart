import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';

class ApiService {
  static Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/cars'));

    final data = json.decode(response.body);
    return data.map<Car>((json) => Car.fromJson(json)).toList();
  }
}
