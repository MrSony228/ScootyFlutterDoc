import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scooty/presentation/custom_icons_icons.dart';
import 'package:scooty/screens/qr-code_scanner.dart';
import 'package:scooty/widgets/filter_modal_bottom_sheet.dart';
import 'package:scooty/widgets/map_handler.dart';
import 'package:scooty/widgets/menu_modal_bottom_sheet.dart';

import '../model/parking_places.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  // DriverLicenseRegistrationScreen(@required UserToRegister user);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

List<ParkingPlaces> parking = [];

class _MainScreenState extends State<MainScreen> {
  MapController mapController = MapController(
    initMapWithUserPosition: true,
  );

  double _batteryLevel = 30;
  double _maxDist = 200;

  @override
  void initState() {
    super.initState();
    setTransportOfParking();
  }

  void setTransportOfParking() async {
    parking = await MapHandler(mapController, parking)
        .setTransport(_maxDist, _batteryLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(children: [
          MapHandler(mapController, parking),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: Center(
                  heightFactor: 10,
                  child: SizedBox(
                      width: 113,
                      height: 23,
                      child: Image.asset("assets/images/logo.png")),
                ),
                leading: IconButton(
                  icon: const Icon(CustomIcons.menu),
                  onPressed: () {
                    MenuModalBottomSheet(context).show();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(CustomIcons.filter),
                    onPressed: () {
                      FilterModalBottomSheet(context, _batteryLevel, _maxDist,
                              parking, mapController)
                          .show();
                    },
                  )
                ],
              )),
          Align(
            widthFactor: double.infinity,
            heightFactor: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 145,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  2.0,
                ],
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff3B3D10),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.yellow,
                        ),
                      ),
                      child: IconButton(
                          onPressed: () async {
                            await mapController.currentLocation();
                            await mapController.setZoom(stepZoom: 14);
                          },
                          icon: const Icon(
                            MdiIcons.navigationVariantOutline,
                            color: Color(0xffEEF511),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const QrCodeScannerScreen()));
                        },
                        child: const Text('Начать поездку')),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
