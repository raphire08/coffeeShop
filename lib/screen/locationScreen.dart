import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ninja_coffee/res/constant.dart';
import 'package:ninja_coffee/model/location.dart';
import 'package:ninja_coffee/widgets/primaryButton.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController mapController;

  final Future<List<double>> initialLocation = Location.getCurrentLocation();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Location', style: heading),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: FutureBuilder(
                    future: initialLocation,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<double>> snap) {
                      if (snap.hasData) {
                        Set<Marker> markerSet = Set();
                        markerSet.add(Marker(
                          markerId: MarkerId('currentLocation'),
                          position: LatLng(snap.data[0], snap.data[1]),
                          draggable: true,
                          anchor: Offset(0.0, 0.0),
                        ));
                        return Stack(
                          children: [
                            GoogleMap(
                              onMapCreated: _onMapCreated,
                              myLocationButtonEnabled: true,
                              markers: markerSet,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(snap.data[0], snap.data[1]),
                                  zoom: 15.0),
                            ),
                            Positioned(
                              left: 50.0,
                              top: 550.0,
                              child: PrimaryButton(
                                text: 'CONFIRM LOCATION',
                                buttonColor: primaryColor,
                                borderColor: primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/paymentScreen',
                                      arguments: ModalRoute.of(context)
                                          .settings
                                          .arguments);
                                },
                              ),
                            )
                          ],
                        );
                      } else {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.white,
                            size: 100.0,
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
