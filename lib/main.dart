import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_app/core/theme/app_theme.dart';
import 'package:vehicle_app/features/vehicle/view/pages/vehicle_page.dart';
import 'package:vehicle_app/features/vehicle/viewmodel/bloc/vehicle_bloc.dart';
import 'package:vehicle_app/firebase_options.dart';
import 'package:vehicle_app/init_dependencies.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initDependencies();

  runApp(
    BlocProvider(
      create: (context) => getIt<VehicleBloc>()..add(VehiclesFetched()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehicle App',
      theme: AppTheme.appTheme,
      home: const VehiclePage(),
    );
  }
}
