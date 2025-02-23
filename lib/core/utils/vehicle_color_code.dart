import 'package:flutter/material.dart';
import 'package:vehicle_app/features/vehicle/models/vehicle_model.dart';

Color getVehicleColor(VehicleModel vehicle) {
  if (vehicle.fuelEfficiency >= 15 && vehicle.age <= 5) {
    return Colors.green;
  } else if (vehicle.fuelEfficiency >= 15 && vehicle.age > 5) {
    return Colors.amber;
  } else {
    return Colors.red;
  }
}
