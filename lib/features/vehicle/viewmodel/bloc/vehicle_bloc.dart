import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_app/features/vehicle/models/vehicle_model.dart';
import 'package:vehicle_app/features/vehicle/repositories/vehicle_remote_repository.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRemoteRepository vehicleRemoteRepository;
  VehicleBloc(this.vehicleRemoteRepository) : super(VehicleInitial()) {
    on<VehiclesFetched>(onVehiclesFetched);
    on<VehicleAdded>(onVehicleAdded);
  }

  void onVehiclesFetched(
    VehiclesFetched event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());

    final res = await vehicleRemoteRepository.getAllVehicles();

    res.fold(
      (l) => emit(VehicleFailure(l.message)),
      (r) => emit(VehicleSuccess(r)),
    );
  }

  void onVehicleAdded(
    VehicleAdded event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());

    final res = await vehicleRemoteRepository.addVehicle(event.vehicle);

    res.fold(
      (l) => emit(VehicleFailure(l.message)),
      (r) {
        emit(VehicleAddedSuccess());
        add(VehiclesFetched());
      },
    );
  }
}
