import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';

class PickFromMapViewBody extends StatefulWidget {
  const PickFromMapViewBody({super.key});

  @override
  State<PickFromMapViewBody> createState() => _PickFromMapViewBodyState();
}

class _PickFromMapViewBodyState extends State<PickFromMapViewBody> {
  GoogleMapController? mapController;
  LatLng selectedLocation = const LatLng(30.0444, 31.2357); // Cairo default

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAddAddress) {
          context.pop(state.addressModel);
        }
      },
      builder: (context, state) => Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: selectedLocation,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              mapController = controller;
            },
            onCameraMove: (position) {
              selectedLocation = position.target;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          /// center pin
          const Center(
            child: Icon(Icons.location_pin, size: 40, color: Colors.red),
          ),

          /// confirm button
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: IgnorePointer(
              ignoring: state is AuthLoading,
              child: AppElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().getAddressFromCoordinates(
                    latitude: selectedLocation.latitude,
                    longitude: selectedLocation.longitude,
                  );
                },
                child: state is AuthLoading
                    ? Center(child: const CircularProgressIndicator())
                    : const Text("Confirm Location"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
