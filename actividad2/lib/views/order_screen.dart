import 'package:actividad2/views/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'corte.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Ordenes'),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Icon(Icons.notifications_none_outlined))
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 24, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CorteScreen()));
                  },
                  title: const Text(
                    'Ordenes de Corte',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      MaterialCommunityIcons.water_pump_off,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ordenes de Reconexión',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      MaterialCommunityIcons.pipe_disconnected,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ordenes de Análisis',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.find_in_page,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ordenes de Investigación',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      MaterialCommunityIcons.home_search,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ordenes de Salidero',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      MaterialCommunityIcons.pipe_leak,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 25, right: 25),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[100]!),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[50]),
              child: Center(
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    'Ordenes de Lectura',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[100]!),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
