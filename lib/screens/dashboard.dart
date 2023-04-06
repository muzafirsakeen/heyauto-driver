import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:awesome_loader_null_safety/awesome_loader_null_safety.dart';

var value;

late Socket socket ;
late CameraPosition cameraPosition;
class GHomePage extends StatefulWidget {
  const GHomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<GHomePage> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  // static final CameraPosition _kGoogle = const CameraPosition(
  //   target: LatLng(20.42796133580664, 80.885749655962),
  //   zoom: 14.4746,
  // );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[

  ];

  // created method for getting user current location
  getCurrentPosition() async
  {
    value = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high);
    socket = await Socket.connect('127.0.0.1', 1524);
    setState((){
      _markers.add(
          Marker(
            markerId: MarkerId("2"),
            icon: markerIcon,
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(
              title: 'My Current Location',
            ),

          )
      );

      // specified current users location
         cameraPosition = new CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 15,
      );


    });

  }

  @override
  void initState() {
    // TODO: implement initState

    getCurrentPosition();

    addCustomIcon();
    super.initState();
  }
  void addCustomIcon() {

    BitmapDescriptor.fromAssetImage(

        const ImageConfiguration(), "assets/images/automarkers.png",)


        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return value == null ? const Center(
      child: AwesomeLoader(
        loaderType: AwesomeLoader.AwesomeLoader1,
        color: Color(0xff071b2c),

      ),
    ) :
      Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            // on below line setting camera position
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,

            initialCameraPosition: cameraPosition,
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      );

      // on pressing floating action button the camera will take to user
      // current locatio
      
      
      

      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      //   floatingActionButton: FloatingActionButton(
      //     backgroundColor: Color(0xffc56b10),
      //   onPressed: () async{
          // getUserCurrentLocation().then((value) async {
          //   print(value.latitude.toString() +" "+value.longitude.toString());

            // marker added for current users location
    //
    //
    //         final GoogleMapController controller = await _controller.future;
    //         controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    //         setState(() {
    //         });
    //       });
    //     },
    //     child: Icon(Icons.navigation),
    //   ),
    //
    //
    //

  // }
}
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          )),
      builder: (context) => DraggableScrollableSheet(

          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child:
              Column(
                children: [


                ],


              ),



            );
          }),
    );
  }


}
