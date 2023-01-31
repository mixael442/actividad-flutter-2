import 'package:actividad2/views/Resumen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:actividad2/views/order_screen.dart';
import 'package:actividad2/views/init_screen.dart';
import 'package:actividad2/views/map.dart';
import 'package:actividad2/views/tecnic_type.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: InitScreen(),
      /*initialRoute: 'init',
      routes: {
        'init': ((context) => const InitScreen()),
        'home': ((context) => const HomeScreen()),
        'resumen': ((context) => const ResumenScreen()),
        'tecnicos': ((context) => const TecnicScreen()),
        'ordenes': ((context) => const OrderScreen()),
        'mapa': ((context) => const MapScreen()),
        'cortes': ((context) => const CorteScreen()),
        'descripcion': ((context) => const DescriptionScreen())
      },*/
    );
  }
}

class HomeScreen extends StatefulWidget {
  int number;
  HomeScreen({super.key, required this.number});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    setState(() {
      currentIndex = HomeScreen(
        number: 2,
      ).number;
    });
  }

  List screens = [
    ResumenScreen(),
    TecnicScreen(),
    OrderScreen(),
    MapScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          height: 85,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[350]!))),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue[900],
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 0
                          ? Colors.blue[300]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.assessment_outlined,
                    )),
                label: 'Resumen',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? Colors.blue[300]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.groups_outlined)),
                label: 'Técnicos',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 2
                          ? Colors.blue[300]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(MaterialCommunityIcons.file_document)),
                label: 'Órdenes',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                      color: currentIndex == 3
                          ? Colors.blue[300]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                        Icon(MaterialCommunityIcons.map_marker_radius_outline)),
                label: 'Mapa',
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
