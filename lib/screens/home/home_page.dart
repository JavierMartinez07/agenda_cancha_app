import 'package:agenda_cancha_app/models/agenda.dart';
import 'package:agenda_cancha_app/models/tiempo.dart';
import 'package:agenda_cancha_app/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Agenda')), elevation: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/courtselection'),
        child: const Icon(Icons.add),
      ),
      body: GetX<HomeController>(
        init: HomeController(),
        builder: (ctrl) => SafeArea(
          child: Column(
            children: [
              FutureBuilder(
                  future: ctrl.getTiempo(),
                  builder: (_, AsyncSnapshot<Tiempo?> snapshot) {
                    var model = snapshot.data;
                    if (snapshot.hasData) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        model?.temp_c.toString() ?? '',
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('°C',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Text(model?.condition.text ?? '')
                                ],
                              ),
                              Image.network(
                                  'https:${model?.condition.icon ?? '//cdn-icons-png.flaticon.com/512/2105/2105242.png'}')
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Listado de canchas agendadas'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ctrl.agendas.length,
                  itemBuilder: (_, i) {
                    Agenda model = ctrl.agendas[i];

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        trailing: InkWell(
                          onTap: () async => await ctrl.deleteAgenda(model),
                          child: const Icon(Icons.clear,
                              color: Colors.red, size: 30),
                        ),
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ctrl.getNameCancha(model.canchaId),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(ctrl.dateFormat(model.fecha)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${model.nombre} ${model.apellido}'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(ctrl.tiempo?.temp_c.toString() ??
                                            ''),
                                        const Text('°C'),
                                      ],
                                    ),
                                    if (ctrl.tiempo != null)
                                      Image.network(
                                          'https:${ctrl.tiempo?.condition.icon ?? '//cdn-icons-png.flaticon.com/512/2105/2105242.png'}',
                                          scale: 2),
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
            ],
          ),
        ),
      ),
    );
  }
}
