part of 'vehicle_bloc.dart';

@immutable
sealed class VehicleState {}

final class VehicleInitial extends VehicleState {}

final class VehicleLoading extends VehicleState {}

final class VehicleFailure extends VehicleState {
  final String message;
  VehicleFailure(this.message);
}

final class VehicleSuccess extends VehicleState {
  final List<VehicleModel> vehicles;
  VehicleSuccess(this.vehicles);
}

final class VehicleAddedSuccess extends VehicleState {}
