import 'package:flutter/material.dart';

import '../model/model.dart';
import 'map.dart';

class DescriptionScreen extends StatelessWidget {
  Data dataID;
  DescriptionScreen({super.key, required this.dataID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('OT01-004'),
        ),
        body: Container(
          width: 400,
          height: 750,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 550,
                width: 350,
                margin: const EdgeInsets.only(top: 15, left: 45, right: 45),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        'Orden a Cargo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${dataID.tecnicoNombre1} ${dataID.tecnicoApellido1}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      title: const Text(
                        'Dirección',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${dataID.puntoSuministroCalle}, ${dataID.puntoSuministroNumeroPuerta}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      isThreeLine: true,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      title: const Text(
                        'Tipo de orden',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        dataID.tipoOrdenDescripcion.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      title: const Text(
                        'Informacion del cliente',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        dataID.puntoSuministroClienteNombre,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black87,
                        size: 19,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    const ListTile(
                      title: Text(
                        'Observaciones',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico',
                        style: TextStyle(color: Colors.black),
                      ),
                      isThreeLine: true,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      title: const Text(
                        'Fecha de asignación',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: dataID.fechaHoraAsignacion != null
                          ? Text(
                              dataID.fechaHoraAsignacion!,
                              style: const TextStyle(color: Colors.black),
                            )
                          : null,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    ListTile(
                      title: const Text(
                        'Marca y Número de serie contador',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${dataID.puntoSuministroAparatoMarca.name}, ${dataID.puntoSuministroAparatoNumSerie}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 50,
                  width: 210,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        if (double.parse(dataID.latitud) != 0.0000000) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MapScreen(
                                    locationID: dataID,
                                  )));
                        } else {
                          return null;
                        }
                      },
                      child: const Text(
                        'Ver en el mapa',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )))
            ],
          ),
        ));
  }
}
