import 'package:agenda_cancha_app/models/agenda.dart';
import 'package:agenda_cancha_app/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Agenda'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/courtselection'),
        child: const Icon(Icons.add),
      ),
      body: GetX<HomeController>(
        init: HomeController(),
        builder: (ctrl) => ListView.builder(
          itemCount: ctrl.agendas.length,
          itemBuilder: (_, i) {
            Agenda model = ctrl.agendas[i];

            return Card(
              elevation: 5,
              child: ListTile(
                trailing: InkWell(
                  onTap: () async => await ctrl.deleteAgenda(model),
                  child: const Icon(Icons.clear, color: Colors.red, size: 30),
                ),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ctrl.getNameCancha(model.canchaId),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(ctrl.dateFormat(model.fecha)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${model.nombre} ${model.apellido}'),
                        Row(
                          children: const [
                            Text('35 C'),
                            Icon(Icons.sunny),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
