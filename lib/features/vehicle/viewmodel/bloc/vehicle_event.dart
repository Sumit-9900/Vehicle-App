part of 'vehicle_bloc.dart';

@immutable
sealed class VehicleEvent {}

final class VehicleAdded extends VehicleEvent {
  final VehicleModel vehicle;
  VehicleAdded(this.vehicle);
}

final class VehiclesFetched extends VehicleEvent {}
