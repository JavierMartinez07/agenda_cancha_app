import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Agenda'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => CourtSelection()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {},
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Cancha A',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Jueves 25, Dic'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Javier De Jesus'),
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
          ),
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {},
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Cancha B',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Martes 27, Dic'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Jessica Reyes'),
                      Row(
                        children: const [
                          Text('15 C'),
                          Icon(Icons.sunny),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {},
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Cancha C',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Viernes 28, Dic'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Vidal Martinez'),
                      Row(
                        children: const [
                          Text('25 C'),
                          Icon(Icons.sunny),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
