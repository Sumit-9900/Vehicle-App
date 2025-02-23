import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_app/core/utils/show_snackbar.dart';
import 'package:vehicle_app/core/widgets/loader.dart';
import 'package:vehicle_app/features/vehicle/models/vehicle_model.dart';
import 'package:vehicle_app/features/vehicle/view/widgets/input_field.dart';
import 'package:vehicle_app/features/vehicle/viewmodel/bloc/vehicle_bloc.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final fuelEfficiencyController = TextEditingController();
  final ageController = TextEditingController();
  final regex = RegExp(r'^\d+$');

  @override
  void dispose() {
    nameController.dispose();
    fuelEfficiencyController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              InputField(
                controller: nameController,
                hintText: 'Vehicle Name',
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter vehicle name!!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              InputField(
                controller: fuelEfficiencyController,
                keyboardType: TextInputType.number,
                hintText: 'Fuel Efficiency (km/litre)',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter fuel efficiency!!!';
                  } else if (!regex.hasMatch(value.trim())) {
                    return 'Please enter only integer value!!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              InputField(
                controller: ageController,
                keyboardType: TextInputType.number,
                hintText: 'Vehicle Age (years)',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter vehicle age!!!';
                  } else if (!regex.hasMatch(value.trim())) {
                    return 'Please enter only integer value!!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<VehicleBloc, VehicleState>(
                listener: (context, state) {
                  if (state is VehicleFailure) {
                    showSnackBar(context, state.message);
                  } else if (state is VehicleAddedSuccess) {
                    showSnackBar(context, 'Vehicle added successfully!!!!');
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  final isLoading = state is VehicleLoading;
                  return ElevatedButton(
                    onPressed:
                        isLoading
                            ? () {}
                            : () {
                              if (formKey.currentState!.validate()) {
                                context.read<VehicleBloc>().add(
                                  VehicleAdded(
                                    VehicleModel(
                                      name: nameController.text.trim(),
                                      fuelEfficiency: int.parse(
                                        fuelEfficiencyController.text.trim(),
                                      ),
                                      age: int.parse(ageController.text.trim()),
                                    ),
                                  ),
                                );
                              }
                            },
                    child: isLoading ? Loader() : Text('Add Vehicle'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
