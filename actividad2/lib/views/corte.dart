import 'package:actividad2/main.dart';
import 'package:actividad2/service/service_corte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../model/model.dart';
import 'description.dart';
import 'map.dart';

class CorteScreen extends StatefulWidget {
  const CorteScreen({Key? key}) : super(key: key);

  @override
  State<CorteScreen> createState() => _CorteScreenState();
}

class _CorteScreenState extends State<CorteScreen> {
  List<Data> dataCorte = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    List<Data> give = await provider.loadData2();
    setState(() {
      setState(() {
        dataCorte = give;
      });
    });
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

  Provider provider = Provider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Ordenes de corte'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[100]!),
                borderRadius: BorderRadius.circular(9),
                color: Colors.blue[50]),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DescriptionScreen(dataID: dataCorte[index])));
              },
              title: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  dataCorte[index].tipoOrdenDescripcion.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    condicion(dataCorte[index]),
                    style: const TextStyle(color: Colors.black87),
                  ),
                  Text(
                    dataCorte[index]
                        .numeroOrden
                        .substring(dataCorte[index].numeroOrden.length - 6),
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ],
              ),
              trailing: double.parse(dataCorte[index].longitud) != 0.0000000
                  ? Container(
                      alignment: Alignment.center,
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[100]!),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[400],
                      ),
                      child: IconButton(
                        icon: const FittedBox(
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          //print(Provider().loadData2());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MapScreen(
                                    locationID: dataCorte[index],
                                  )));
                        },
                      ),
                    )
                  : null,
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
                  MaterialCommunityIcons.water_pump_off,
                  color: Colors.blue[900],
                  size: 20,
                ),
              ),
            ),
          );
        },
        itemCount: dataCorte.length,
      ),
    );
  }
}
