import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  void loadCars() async {
    final data = await ApiService.fetchCars();
    setState(() {
      cars = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Rental')),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cars[index].name),
            subtitle: Text("KES ${cars[index].price}"),
          );
        },
      ),
    );
  }
}
