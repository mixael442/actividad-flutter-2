// To parse this JSON data, do
//
//     final usuarios = usuariosFromMap(jsonString);

import 'dart:convert';

class Data {
  Data({
    required this.numeroOrden,
    required this.estado,
    this.fechaHoraAsignacion,
    this.fechaHoraUltModificacion,
    required this.puntoSuministroCalle,
    required this.puntoSuministroNumeroPuerta,
    required this.puntoSuministroClienteNombre,
    required this.puntoSuministroClienteApellido1,
    required this.puntoSuministroClienteApellido2,
    required this.puntoSuministroAparatoMarca,
    required this.puntoSuministroAparatoNumSerie,
    this.tecnicoNombre1,
    this.tecnicoApellido1,
    this.tecnicoApellido2,
    required this.tipoOrdenDescripcion,
    required this.latitud,
    required this.longitud,
  });

  String numeroOrden;
  int estado;
  String? fechaHoraAsignacion;
  dynamic fechaHoraUltModificacion;
  String puntoSuministroCalle;
  int puntoSuministroNumeroPuerta;
  String puntoSuministroClienteNombre;
  String puntoSuministroClienteApellido1;
  String puntoSuministroClienteApellido2;
  PuntoSuministroAparatoMarca puntoSuministroAparatoMarca;
  String puntoSuministroAparatoNumSerie;
  String? tecnicoNombre1;
  String? tecnicoApellido1;
  TecnicoApellido2? tecnicoApellido2;
  TipoOrdenDescripcion tipoOrdenDescripcion;
  String latitud;
  String longitud;

  //factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        numeroOrden: json["numero_orden"],
        estado: json["estado"],
        fechaHoraAsignacion: json["fecha_hora_asignacion"],
        fechaHoraUltModificacion: json["fecha_hora_ult_modificacion"],
        puntoSuministroCalle: json["punto_suministro__calle"],
        puntoSuministroNumeroPuerta: json["punto_suministro__numero_puerta"],
        puntoSuministroClienteNombre: json["punto_suministro__cliente__nombre"],
        puntoSuministroClienteApellido1:
            json["punto_suministro__cliente__apellido_1"],
        puntoSuministroClienteApellido2:
            json["punto_suministro__cliente__apellido_2"],
        puntoSuministroAparatoMarca: puntoSuministroAparatoMarcaValues
            .map[json["punto_suministro__aparato__marca"]]!,
        puntoSuministroAparatoNumSerie:
            json["punto_suministro__aparato__num_serie"],
        tecnicoNombre1: json["tecnico__nombre_1"],
        tecnicoApellido1: json["tecnico__apellido_1"],
        tecnicoApellido2:
            tecnicoApellido2Values.map[json["tecnico__apellido_2"]],
        tipoOrdenDescripcion:
            tipoOrdenDescripcionValues.map[json["tipo_orden__descripcion"]]!,
        latitud: json["latitud"],
        longitud: json["longitud"],
      );
}

enum PuntoSuministroAparatoMarca { MC999 }

final puntoSuministroAparatoMarcaValues =
    EnumValues({"MC999": PuntoSuministroAparatoMarca.MC999});

enum TecnicoApellido2 { QORDER, DOS }

final tecnicoApellido2Values = EnumValues(
    {"dos": TecnicoApellido2.DOS, "qorder": TecnicoApellido2.QORDER});

enum TipoOrdenDescripcion { Reapertura_de_servicio, CORTE }

final tipoOrdenDescripcionValues = EnumValues({
  "Corte": TipoOrdenDescripcion.CORTE,
  "Reapertura de servicio": TipoOrdenDescripcion.Reapertura_de_servicio
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
