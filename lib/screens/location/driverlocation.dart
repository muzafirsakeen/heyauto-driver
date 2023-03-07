import 'package:flutter/material.dart';
import 'package:heyauto/color_constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/constants.dart';

/*
Title:GoogleMapScreen
Purpose:GoogleMapScreen
Created By:Musafar Sakeen
*/

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({ Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late double height, width;
  int amountTxt = 0;
  String passname = "Total Distance";
  String restaurantName = "pickup location here";
  String addressTxt = "drop of location here";
  late GoogleMapController mapController;
  late BitmapDescriptor pinLocationIcon;
  double _originLatitude = 11.44942984467808,  _originLongitude =75.77373689462148;

  double _destLatitude = 11.434175924080199, _destLongitude = 75.77358068539846;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [

  ];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Your Google Map Key
      PointLatLng(_originLatitude,_originLongitude ),
      PointLatLng(_destLatitude, _destLongitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  PolylinePoints polylinePoints = PolylinePoints();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  String googleAPiKey = "AIzaSyDaHL_wZ031O6LhuW5KVWS7zN1ggdIrtNY";

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      visible: true,
      color: ColorConstants.kGreyTextColor.withOpacity(0.5),
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: pinLocationIcon,
      position: position,
    );
    markers[markerId] = marker;
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [
          PolylineWayPoint(
            location: " ",
          ),
        ]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
  void setCustomMapPin() async {
     pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMapPin();

    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarker,
    );
    _getPolyline();
    getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude),
                zoom: 12,
              ),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: false,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pop(context);

              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 15,
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.navigation,
                    color: ColorConstants.kBlackColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff071b2c),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Distance: " + passname,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontFamily: "Poppins Regular",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Total Payment: " +
                                "\u{20B9}" +
                                amountTxt.toString(),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontFamily: "Poppins Regular",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: ColorConstants.kGreyTextColor.withOpacity(0.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kGreenTextColor,
                                  borderRadius: BorderRadius.circular(8 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kDividerColor,
                                  borderRadius: BorderRadius.circular(3 / 2),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: ColorConstants.kGreenTextColor,
                                  borderRadius: BorderRadius.circular(8 / 2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pickup Location",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  fontFamily: "Poppins Regular",
                                  fontSize: 14,
                                  color: Color(0xffd39905),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                restaurantName,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Drop off Location",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  fontSize: 14,
                                  fontFamily: "Poppins Regular",
                                  color: Color(0xffd39905),                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                addressTxt,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "Poppins Medium",
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}