import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vehicle_app/core/error/failure.dart';
import 'package:vehicle_app/features/vehicle/models/vehicle_model.dart';

abstract interface class VehicleRemoteRepository {
  Future<Either<Failure, void>> addVehicle(VehicleModel vehicle);
  Future<Either<Failure, List<VehicleModel>>> getAllVehicles();
}

class VehicleRemoteRepositoryImpl implements VehicleRemoteRepository {
  final FirebaseFirestore firestore;
  VehicleRemoteRepositoryImpl(this.firestore);

  @override
  Future<Either<Failure, void>> addVehicle(VehicleModel vehicle) async {
    try {
      await firestore.collection('vehicles').add(vehicle.toMap());

      return right(null);
    } on FirebaseException catch (e) {
      return left(Failure(e.message ?? "An error occurred"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VehicleModel>>> getAllVehicles() async {
    try {
      final querySnapshot = await firestore.collection('vehicles').get();

      final vehicles =
          querySnapshot.docs
              .map((doc) => VehicleModel.fromMap(doc.data()))
              .toList();

      return right(vehicles);
    } on FirebaseException catch (e) {
      return left(Failure(e.message ?? "An error occurred"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
