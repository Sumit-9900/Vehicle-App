import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:vehicle_app/features/vehicle/repositories/vehicle_remote_repository.dart';
import 'package:vehicle_app/features/vehicle/viewmodel/bloc/vehicle_bloc.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  getIt.registerFactory<VehicleRemoteRepository>(
    () => VehicleRemoteRepositoryImpl(getIt()),
  );

  getIt.registerFactory(() => VehicleBloc(getIt()));
}
