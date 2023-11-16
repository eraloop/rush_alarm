import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rush_alert/helpers/colors.dart';
import 'package:rush_alert/helpers/permissions.dart';
import 'package:rush_alert/helpers/utils.dart';
import 'package:rush_alert/providers/UserProvider.dart';
import 'package:rush_alert/screens/home.dart';
class Location extends StatefulWidget {
  const Location({super.key, this.location, this.town, this.data});

  final location;
  final town;
  final data;

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  GoogleMapController? _controller;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: true,
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: widget.location,
                zoom: 15.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              // onCameraMove: (CameraPosition position) {
              //   _controller?.animateCamera(CameraUpdate.newCameraPosition(position));
              // },

              markers: {
                Marker(
                  markerId: MarkerId('1'),
                  position: widget.location,
                )
              },
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: (){
                print("clicked");
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  ),
                ),
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text('Current location',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: ColorUtils.DarkGrey,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                      child: Row(
                        children: [
                          Text('Your Coordinates : ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                          Text( widget.location.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.w700,
                              )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                      child: Row(
                        children: [
                          Text('Your current town : ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                          Text( widget.town.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.w700,
                              )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only( top: 10, right: 10, left: 10),
                      child: TextButton(
                          onPressed: () async {

                            Utils.loadingProgress(context);
                            await Provider.of<UserProvider>(context, listen: false).register(widget.data);
                            Utils.showToast(ColorUtils.Green, "Welcome to Rush Alarm");
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()), (route) => false);
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric( vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorUtils.Green,
                            ),
                            child: Text("Continue",
                                style:  Theme.of(context).textTheme.headline5?.copyWith(
                                    color:  Colors.white
                                )
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      )
    );
  }
}
