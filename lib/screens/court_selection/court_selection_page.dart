import 'package:agenda_cancha_app/screens/court_selection/court_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CourtSelectionPage extends StatelessWidget {
  final ctrl = Get.put(CourtSelectionController());
  CourtSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Canchas')),
        bottomNavigationBar: ElevatedButton(
          onPressed: () async => await ctrl.agendar(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.calendar_month_outlined, size: 30),
                SizedBox(width: 10),
                Text(
                  'Agendar',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        body: FormBuilder(
          key: ctrl.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FormBuilderRadioGroup(
                  decoration:
                      const InputDecoration(labelText: 'Selecionar cancha'),
                  name: 'cancha',
                  initialValue: 1,
                  options: ctrl.canchas
                      .map((model) => FormBuilderFieldOption(
                            value: model.id,
                            child: Text(model.nombre),
                          ))
                      .toList(growable: false),
                ),
                const SizedBox(height: 10),
                FormBuilderDateTimePicker(
                  name: 'fecha',
                  decoration: const InputDecoration(labelText: 'Fecha'),
                  initialValue: DateTime.now(),
                ),
                FormBuilderTextField(
                  name: 'nombre',
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                FormBuilderTextField(
                  name: 'apellido',
                  decoration: const InputDecoration(labelText: 'Apellido'),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ));
  }
}
