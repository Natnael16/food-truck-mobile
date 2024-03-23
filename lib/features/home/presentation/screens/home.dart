import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_truck/features/home/presentation/widgets/circle_icon_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/custom_textfield.dart';
import '../../../../core/theme/colors.dart';

import '../widgets/available_section.dart';
import '../widgets/circle_button_with_icon.dart';
import '../widgets/facility_selection_widget.dart';
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
    return Scaffold(
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
  bool showCrowed = false;
  bool showFoodTrucks = true;
  String facilityType = "Truck";

  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController searchController = TextEditingController();
  Set<Marker> _markers = {};
  var currentLocation = const LatLng(8.90042, 38.72334);

  BitmapDescriptor? truckMapIcon;

  @override
  void initState() {
    super.initState();
    requestLocationPermissions();
    initializeMarkerImages();
  }

  void initializeMarkerImages() async {
    truckMapIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(0.2, 0.2)),
      'assets/images/food_truck_icon_1.png',
    );

    setState(() {});
  }

  void setTruckLocations() {
    List<LatLng> centerCircle = [
      LatLng(currentLocation.latitude, currentLocation.longitude),
      LatLng(currentLocation.latitude - 0.0013,
          currentLocation.longitude + 0.0022),
      LatLng(
          currentLocation.latitude + 0.010, currentLocation.longitude - 0.0112),
      LatLng(currentLocation.latitude + 0.0102,
          currentLocation.longitude - 0.0012),
    ];

    _markers = Set.from(centerCircle.map((pos) {
      return Marker(
          markerId: MarkerId(pos.toString()),
          icon: truckMapIcon ?? BitmapDescriptor.defaultMarker,
          position: pos,
          onTap: () async {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Text('detail');
                });
          });
    }));
  }

  void setCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });

    if (_controller.isCompleted) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(
        LatLng(currentLocation.latitude, currentLocation.longitude),
      ));
      setTruckLocations();
    }
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
        GoogleMap(
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
          markers: showFoodTrucks ? _markers : {},
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
                    backgroundColor: radiusWidget ? primaryColor : white,
                    onTap: () {}),
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
        return SearchFoodsBottomSheet(); // Use SearchFoodsBottomSheet widget here
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
