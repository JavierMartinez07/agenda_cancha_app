import 'dart:convert';

import 'package:agenda_cancha_app/db_services/agenda_services.dart';
import 'package:agenda_cancha_app/models/agenda.dart';
import 'package:agenda_cancha_app/models/cancha.dart';
import 'package:agenda_cancha_app/models/tiempo.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var agendas = <Agenda>[].obs;
  Tiempo? tiempo;

  final canchas = <Cancha>[
    Cancha(1, 'Cancha A'),
    Cancha(2, 'Cancha B'),
    Cancha(3, 'Cancha C'),
  ];

  @override
  void onInit() {
    getAgendas();
    getTiempo();
    super.onInit();
  }

  Future<void> getAgendas() async {
    agendas.clear();
    var list = await AgendaServices.getAgendas();
    list.sort((a, b) {
      DateFormat format = DateFormat("yyyy-MM-dd");
      var fecha1 = format.parse(a.fecha);
      var fecha2 = format.parse(b.fecha);
      return fecha2.compareTo(fecha1);
    });
    agendas.addAll(list);
  }

  String dateFormat(String fecha) =>
      formatDate(DateTime.parse(fecha), [DD, ', ', dd, ' ', M],
          locale: const SpanishDateLocale());

  String getNameCancha(int canchaId) =>
      canchas.where((x) => x.id == canchaId).first.nombre;

  Future<Tiempo?> getTiempo() async {
    const String url =
        'https://api.weatherapi.com/v1/current.json?key=99c2621367f040a6ac7185824221112&q=Dominican Republic&lang=es';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      tiempo = Tiempo.fromJson(json['current']);
    }
    return tiempo;
  }

  Future<void> deleteAgenda(Agenda model) async {
    Get.defaultDialog(
      title: 'Advertencia',
      middleText: 'Esta seguro que desea eliminar esta agenda?',
      textConfirm: 'Aceptar',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await AgendaServices.delete(model.id ?? 0);
        await getAgendas();
        refresh();
        Get.back();
      },
      textCancel: 'Cancelar',
      // cancelTextColor: Colors.white,
      onCancel: () => Get.back(),
    );
  }
}
