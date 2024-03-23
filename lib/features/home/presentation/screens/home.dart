import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/custom_textfield.dart';
import '../../../../core/theme/colors.dart';

import '../../data/models/food_truck_model.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/available_section.dart';
import '../widgets/circle_button_with_icon.dart';
import '../widgets/facility_selection_widget.dart';
import '../widgets/food_truck_detail.dart';
import '../widgets/radius_selector.dart';
import '../widgets/search_food_bottom_sheet.dart';
import '../widgets/warning_enable_location.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: white,
        drawerScrimColor: Colors.transparent,
        body: SafeArea(child: ScaffoldBody()));
  }
}

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({super.key});

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  bool trafficEnabled = false;
  int radius = 3;
  bool available = false;
  bool isTruck = false;
  bool radiusWidget = false;
  bool showFoodTrucks = true;
  String facilityType = "Truck";

  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController searchController = TextEditingController();
  Set<Marker> _markers = {};
  var currentLocation = const LatLng(37.76008693198698, -122.41880648110114);

  BitmapDescriptor? truckMapIcon;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(const SearchFoodTruck());
    requestLocationPermissions();
    initializeMarkerImages();
  }

  search() {
    BlocProvider.of<SearchBloc>(context).add(SearchFoodTruck(
        query: searchController.text,
        isTruck: facilityType == 'Truck' ? true : false,
        isAvailable: available,
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        radius: double.parse(radius.toString()) * 1000));
  }

  void initializeMarkerImages() async {
    truckMapIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(0.2, 0.2)),
      'assets/images/food_truck_icon_1.png',
    );

    setState(() {});
  }

  void setTruckLocations(List<FoodTruck> foodTrucks) {
    _markers = Set.from(foodTrucks.map((truck) {
      return Marker(
          markerId:
              MarkerId(truck.location.toString() + truck.applicant.toString()),
          icon: truckMapIcon ?? BitmapDescriptor.defaultMarker,
          position: truck.location ?? const LatLng(0, 0),
          onTap: () async {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FoodTruckDetailsBottomSheet(foodTruck: truck);
                });
          });
    }));
    setState(() {});
  }

  void setCurrentLocation() async {
    // Position position = await Geolocator.getCurrentPosition();

    // setState(() {
    //   currentLocation = LatLng(position.latitude, position.longitude);
    // });

    // if (_controller.isCompleted) {
    //   final GoogleMapController controller = await _controller.future;
    //   // controller.animateCamera(CameraUpdate.newLatLng(
    //   //   LatLng(currentLocation.latitude, currentLocation.longitude),
    //   // ));
    // }
  }

  void requestLocationPermissions() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
    } else {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: white.withOpacity(0.2),
                    child: LocationWarning(
                      onCancelPressed: () {
                        Navigator.of(context).pop();
                      },
                      onEnablePressed: () async {
                        await openAppSettings();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<SearchBloc, SearchState>(
          listener: (context, state) {
            if (state is SearchLoading) {
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevent dismissing by tapping outside
                builder: (BuildContext context) {
                  return const Center(
                    child:
                        CircularProgressIndicator(), // Circular loading indicator
                  );
                },
              );
            } else if (state is SearchSuccess) {
              // Hide loading indicator and set the truck locations
              Navigator.of(context).pop(); // Dismiss the loading indicator
              setState(() {
                setTruckLocations(state.foodTrucks);
              });
            } else if (state is SearchFailure) {
              Navigator.of(context).pop(); // Dismiss the loading indicator
              // Show SnackBar for failure
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to fetch food trucks'),
                  duration: Duration(seconds: 3), // Adjust duration as needed
                ),
              );
            }
          },
          builder: (context, state) {
            return GoogleMap(
              myLocationEnabled: true,
              trafficEnabled: trafficEnabled,
              zoomControlsEnabled: false,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.76008693198698, -122.41880648110114),
                zoom: 14.5,
              ),
              onMapCreated: (controller) {
                _controller.complete(controller);
                setCurrentLocation();
              },
              markers: _markers,
            );
          },
        ),
        Container(
            margin: const EdgeInsets.only(top: 0),
            child: ToggleButton(
              value: available,
              onToggleChanged: (isToggled) async {
                setState(
                  () {
                    available = !available;
                  },
                );
              },
            )),
        Container(
            margin: const EdgeInsets.only(top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextField(controller: searchController),
                CircleButton(
                    shadow: true,
                    imageIcon: Transform.scale(
                        scale: 0.5,
                        child:
                            const Icon(Icons.search, size: 60, color: black)),
                    backgroundColor: white,
                    onTap: search),
              ],
            )),
        rightSideActions(),
        if (isTruck)
          Positioned(
            bottom: 200,
            left: 100,
            child: FacilityTypeSelector(
                selectedFacility: facilityType,
                onSelected: (change) {
                  setState(() {
                    facilityType = change;
                  });
                }),
          ),
        if (radiusWidget)
          Positioned(
            bottom: 200,
            right: 100,
            child: RadiusSelectionWidget(
                selectedRadius: radius,
                onRadiusSelected: (currentRadius) {
                  setState(() {
                    radius = currentRadius;
                  });
                },
                onSet: () {
                  setState(() {
                    radiusWidget = false;
                  });
                }),
          ),
      ],
    );
  }

  rightSideActions() {
    return Positioned(
      bottom: 50,
      right: 15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
              shadow: true,
              imageIcon: Transform.scale(
                  scale: 0.5,
                  child: Icon(Icons.radar_outlined,
                      size: 60, color: radiusWidget ? white : black)),
              backgroundColor: radiusWidget ? primaryColor : white,
              onTap: onRadiusButtonPressed),
          SizedBox(height: 2.h),
          CircleButton(
            shadow: true,
            imageIcon: Transform.scale(
                scale: 0.5,
                child: Icon(Icons.directions_bus,
                    size: 60, color: isTruck ? white : black)),
            backgroundColor: isTruck ? primaryColor : white,
            onTap: onfacilityTypeButtonPressed,
          ),
          SizedBox(height: 2.h),
          CircleButton(
            shadow: true,
            imageIcon: Transform.scale(
              scale: 0.5,
              child: const Icon(Icons.fastfood_outlined, size: 60),
            ),
            onTap: onSearchFoods,
            backgroundColor: white,
          ),
          SizedBox(height: 2.h),
          CircleButton(
            shadow: true,
            imageIcon: Transform.scale(
              scale: 1,
              child: const Icon(Icons.location_searching_outlined, size: 30),
            ),
            onTap: () {
              setCurrentLocation();
            },
            backgroundColor: white,
          ),
        ],
      ),
    );
  }

  onSearchFoods() {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const SearchFoodsBottomSheet(); // Use SearchFoodsBottomSheet widget here
      },
    );
  }

  onfacilityTypeButtonPressed() {
    setState(() {
      radiusWidget = false;
      isTruck = !isTruck;
    });
  }

  onRadiusButtonPressed() {
    setState(() {
      isTruck = false;
      radiusWidget = !radiusWidget;
    });
  }
}
