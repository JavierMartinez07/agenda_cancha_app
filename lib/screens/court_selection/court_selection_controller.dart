import 'package:agenda_cancha_app/db_services/agenda_services.dart';
import 'package:agenda_cancha_app/models/agenda.dart';
import 'package:agenda_cancha_app/models/cancha.dart';
import 'package:agenda_cancha_app/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CourtSelectionController extends GetxController {
  final canchas = <Cancha>[
    Cancha(1, 'Cancha A'),
    Cancha(2, 'Cancha B'),
    Cancha(3, 'Cancha C'),
  ];
  var formKey = GlobalKey<FormBuilderState>();
  var homeCtrl = Get.find<HomeController>();

  Future<void> agendar() async {
    if (formKey.currentState != null) {
      bool isValid = formKey.currentState?.saveAndValidate() ?? false;
      if (isValid) {
        var modelMap = formKey.currentState!.value;
        Agenda model = Agenda(
          null,
          modelMap['cancha'],
          modelMap['fecha'].toString(),
          modelMap['nombre'],
          modelMap['apellido'],
          '',
        );

        bool valid = await validAgenda(model);
        if (valid) {
          await AgendaServices.insert(model);
          await homeCtrl.getAgendas();
          Get.back();
        } else {
          Get.defaultDialog(
            title: 'Solicitud de agenda',
            middleText:
                'La cancha selecionada no esta disponible para dicha fecha',
            textConfirm: 'Ok',
            confirmTextColor: Colors.white,
            onConfirm: () => Get.back(),
          );
        }
      } else {
        Get.defaultDialog(
          title: 'Informacion',
          middleText: 'Hay campos incompletos',
          textConfirm: 'Ok',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      }
    }
  }

  void onChange(dynamic value) {}

  Future<bool> validAgenda(Agenda model) async {
    bool result = false;
    try {
      List<Agenda> agendas = await AgendaServices.validAgenda(model);
      if (agendas.length < 3) {
        result = true;
      }
    } on Exception catch (_) {
      result = false;
    }
    return result;
  }
}
