import 'package:flutter/material.dart';
import 'package:vehicle_app/core/utils/vehicle_color_code.dart';
import 'package:vehicle_app/features/vehicle/models/vehicle_model.dart';

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: getVehicleColor(vehicle),
      child: ListTile(
        title: Text(
          vehicle.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Fuel Efficiency: ${vehicle.fuelEfficiency} km/L\nAge: ${vehicle.age} years',
        ),
        leading: const Icon(Icons.directions_car),
      ),
    );
  }
}
