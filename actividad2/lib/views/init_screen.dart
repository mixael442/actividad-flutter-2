import 'package:actividad2/service/service_corte.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Center(
              child: Image.asset(
                "assets/Burger_King_logo_emblem-2.png",
                height: 350,
                width: 350,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 230),
            padding: const EdgeInsets.all(25),
            child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Provider().loadData2();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => HomeScreen(number: 2)));
                  },
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ),
          const Text(
            'No tienes Cuenta? Crear una',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
