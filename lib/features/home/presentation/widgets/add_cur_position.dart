import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/theme/colors.dart';

class AddCurPositionBottomSheet extends StatelessWidget {
  final LatLng location;
  const AddCurPositionBottomSheet({super.key, required this.location});
  Future<String> getLocationName() async {
    final placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    final locality = "${placemarks[0].locality}, ";
    final subLocality = "${placemarks[0].subLocality}, " ?? "Unknown street";
    final street = placemarks[0].street ?? " ";
    final placeName = locality + subLocality + street;
    return placeName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    minRadius: 20,
                    backgroundColor: white,
                    child: Icon(Icons.location_on, color: black),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: FutureBuilder(
                        future: getLocationName(),
                        builder: (context, snap) {
                          return Text(
                              snap.data ?? "Fetching Place Information ...",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold));
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
                text: "Add Current Location",
                onTap: () {
                  context.pop(true);
                },
                height: 5.h,
                width: 58.w),
          ],
        )));
  }
}
