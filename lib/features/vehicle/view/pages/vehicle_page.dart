import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_app/core/widgets/loader.dart';
import 'package:vehicle_app/features/vehicle/view/pages/add_vehicle_page.dart';
import 'package:vehicle_app/features/vehicle/view/widgets/vehicle_card.dart';
import 'package:vehicle_app/features/vehicle/viewmodel/bloc/vehicle_bloc.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 120,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => AddVehiclePage()));
                },
                label: Text('Add Vehicle'),
                icon: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          if (state is VehicleLoading) {
            return Loader();
          } else if (state is VehicleFailure) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            );
          } else if (state is VehicleSuccess) {
            final vehicles = state.vehicles;
            return vehicles.isEmpty
                ? Center(
                  child: Text(
                    'No Vehicles to display!!!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 6),
                    itemCount: vehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = vehicles[index];
                      return VehicleCard(vehicle: vehicle);
                    },
                  ),
                );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
