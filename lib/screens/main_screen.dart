import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scooty/presentation/custom_icons_icons.dart';

class MainScreen extends StatefulWidget {
  // DriverLicenseRegistrationScreen(@required UserToRegister user);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  MapController mapController = MapController(
    initMapWithUserPosition: true,
    //initPosition:
    // GeoPoint(latitude: 54.77709442821226, longitude: 32.05061381203036),
    //areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
  );

  void addMarker() {
    mapController
        .addMarker(GeoPoint(latitude: 54.776769, longitude: 32.079766));
  }

  Map<String, List<double>> predefinedFilters = {
    'Invers': [
      //R  G   B    A  Const
      -1, 0, 0, 0, 255, //
      0, -1, 0, 0, 255, //
      0, 0, -1, 0, 255, //
      0, 0, 0, 1, 0, //
    ],
  };

  RangeValues batteryRangeValue = const RangeValues(40, 80);
  RangeValues distanceRangeValue = const RangeValues(250,750);
  RangeLabels labels = RangeLabels('1', "100");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix(<double>[
              -1, 0, 0, 0, 255, //
              0, -1, 0, 0, 255, //
              0, 0, -1, 0, 255, //
              0, 0, 0, 1, 0, //
            ]),
            child: OSMFlutter(
              controller: mapController,
              trackMyPosition: true,

              initZoom: 18,
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    MdiIcons.crosshairsGps,
                    color: Color(0xff0014c4),
                    size: 70,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 1,
                  ),
                ),
              ),
              // roadConfiguration: RoadConfiguration(
              //   startIcon: const MarkerIcon(
              //     icon: Icon(
              //       CustomIcons.location,
              //       size: 64,
              //       color: Colors.brown,
              //     ),
              //   ),
              //   roadColor: Colors.yellowAccent,
              // ),
              // markerOption: MarkerOption(
              //     defaultMarker: const MarkerIcon(
              //   icon: Icon(
              //     CustomIcons.location,
              //     color: Colors.blue,
              //     size: 56,
              //   ),
              // )),
            ),
          ),
          Container(
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
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    height: 3,
                                    width: 60,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                dialogLine('Уведомления', MdiIcons.bellOutline,
                                    () {
                                  Navigator.pop(context);
                                }),
                                dialogLine('Профиль', MdiIcons.accountOutline,
                                    () {
                                  Navigator.pop(context);
                                }),
                                dialogLine('История поездок', MdiIcons.history,
                                    () {
                                  Navigator.pop(context);
                                }),
                                dialogLine('Сохраненные карты',
                                    MdiIcons.creditCardOutline, () {
                                  Navigator.pop(context);
                                }),
                                dialogLine('Выход', MdiIcons.exitToApp, () {
                                  Navigator.pop(context);
                                }),
                                const SizedBox(
                                  height: 42,
                                ),
                                Container(
                                  height: 165,
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow,
                                      image: DecorationImage(
                                          image: const AssetImage(
                                            "assets/images/vector.png",
                                          ),
                                          alignment: Alignment.centerRight,
                                          colorFilter: ColorFilter.mode(
                                              Colors.yellow.withOpacity(0.08),
                                              BlendMode.dstATop))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Дмитрий\nИгнатенков',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontFamily: 'Cera-Pro',
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const Spacer(),
                                            Expanded(
                                              child: SvgPicture.asset(
                                                'assets/images/scootyWallet.svg',
                                                alignment: Alignment.topCenter,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: const Text('150 Руб',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontFamily: 'Cera-Pro',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            //   const Spacer(),
                                            Expanded(
                                                child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  MdiIcons.arrowRight),
                                              alignment: Alignment.bottomRight,
                                            ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 42,
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(CustomIcons.filter),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.black,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setModalState) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        height: 3,
                                        width: 60,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Уровень батареи',
                                                textAlign: TextAlign.left,
                                              )),
                                          RangeSlider(
                                              activeColor: Colors.yellow,
                                              inactiveColor:
                                                  const Color(0xff454545),
                                              min: 1.0,
                                              max: 100.0,
                                              values: batteryRangeValue,
                                              labels: labels,

                                              divisions: 99,
                                              onChanged:
                                                  (RangeValues newValues) {
                                                setModalState(() {
                                                  batteryRangeValue = newValues;
                                                  labels = RangeLabels(
                                                    batteryRangeValue.start
                                                            .toInt()
                                                            .toString() +
                                                        "%",
                                                    batteryRangeValue.end
                                                            .toInt()
                                                            .toString() +
                                                        "%",
                                                  );
                                                });
                                              }),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Дистанция до транспорта',
                                                textAlign: TextAlign.left,
                                              )),
                                          RangeSlider(
                                              activeColor: Colors.yellow,
                                              inactiveColor:
                                              const Color(0xff454545),
                                              min: 1.0,
                                              max: 1000.0,
                                              values: distanceRangeValue,
                                              labels: labels,

                                              divisions: 99,
                                              onChanged:
                                                  (RangeValues newValues) {
                                                setModalState(() {
                                                  distanceRangeValue = newValues;
                                                  labels = RangeLabels(
                                                    distanceRangeValue.start
                                                        .toInt()
                                                        .toString() +
                                                        "М",
                                                    distanceRangeValue.end
                                                        .toInt()
                                                        .toString() +
                                                        "М",
                                                  );
                                                });
                                              }),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 45,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text("Показать")),
                                          ),
                                          const SizedBox(
                                            height: 42,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                          });
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
                        border: Border.all(color: Colors.yellow, ),
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
                  )
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 45,
                  //   child: ElevatedButton(
                  //       onPressed: () {}, child: const Text('Начать поездку')),
                  // ),
                  // const SizedBox(
                  //   height: 25,
                  // )

                ],
              ),
            ),
          )
        ]));
  }

  Widget dialogLine(String text, IconData icon, GestureTapCallback action) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Cera-Pro',
        ),
      ),
      onTap: action,
    );
  }
}
