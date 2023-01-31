import 'package:actividad2/service/service_corte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/model.dart';

class MapScreen extends StatefulWidget {
  Data? locationID;
  MapScreen({super.key, this.locationID});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    showMarker();
  }

  String condicion(Data data) {
    if (data.estado == 1) {
      return 'Pendiente';
    } else if (data.estado == 3) {
      return 'Asignada';
    } else if (data.estado == 7) {
      return 'Cargada';
    } else if (data.estado == 33) {
      return 'Problema';
    } else {
      return 'Trabajada';
    }
  }

  List<Data> fol = [];

  Provider pro = Provider();

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  showAllMarkers() async {
    fol = await pro.loadData2();
    for (var i = 0; i < fol.length; i++) {
      if (double.parse(fol[i].longitud) != 0.0000000) {
        final markerID = MarkerId(i.toString());
        final marker = Marker(
            //icon: icon,
            markerId: markerID,
            position: LatLng(
                double.parse(fol[i].latitud), double.parse(fol[i].longitud)),
            onTap: () {
              showMyDialog(i);
            });
        _markers[markerID] = marker;
      }
      setState(() {});
    }
  }

  showMarker() {
    if (widget.locationID != null) {
      onTap(LatLng(double.parse(widget.locationID!.latitud),
          double.parse(widget.locationID!.longitud)));
    } else {
      return null;
    }
  }

  onTap(LatLng position) {
    final markerID = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerID,
      position: position,
    );
    _markers[markerID] = marker;
    setState(() {});
  }

  void showMyDialog(int i) {
    showDialog(
        barrierDismissible: false,
        useRootNavigator: true,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            insetPadding: EdgeInsets.only(top: 450),
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.blue[50],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            children: [
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    fol[i].tipoOrdenDescripcion.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      condicion(fol[i]),
                      style: const TextStyle(color: Colors.black87),
                    ),
                    Text(
                      fol[i]
                          .numeroOrden
                          .substring(fol[i].numeroOrden.length - 6),
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
                leading: Container(
                  //margin: const EdgeInsets.only(bottom: 18),
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue[100]!),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[300],
                  ),
                  child: Icon(
                    MaterialCommunityIcons.pipe_disconnected,
                    color: Colors.blue[900],
                    size: 20,
                  ),
                ),
              )
            ],
          );
        },
        anchorPoint: const Offset(1.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition cameraPosition = CameraPosition(
      target: widget.locationID != null
          ? LatLng(double.parse(widget.locationID!.latitud),
              double.parse(widget.locationID!.longitud))
          : const LatLng(-31.3902800, -64.2050000),
      zoom: widget.locationID != null ? 15 : 8,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: widget.locationID != null
            ? const Text('Orden')
            : const Text('Mapa'),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(Icons.notifications_none_outlined))
        ],
      ),
      drawer: Drawer(),
      body: GoogleMap(markers: markers, initialCameraPosition: cameraPosition),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 65),
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue[300],
        ),
        child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            elevation: 5,
            onPressed: () {
              showAllMarkers();
            },
            label: const Icon(Icons.menu, color: Colors.black)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
