import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SecondaScheda.dart';

class PrimaScheda extends StatefulWidget {
  const PrimaScheda({Key? key}) : super(key: key);

  @override
  State<PrimaScheda> createState() => _PrimaSchedaState();
}

class _PrimaSchedaState extends State<PrimaScheda> {
  final TextEditingController _controller = TextEditingController();
  int rispostaSbagliata = 0;
  String risposta = " ";
  bool stateButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("sfida 1/3"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 420,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              padding: const EdgeInsets.all(7),
              children: [
                Image.asset(
                  "images/cielo1_1.png",
                  width: 30,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "images/cielo2_1.png",
                  width: 30,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "images/cielo3_1.png",
                  width: 30,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "images/cielo4_1.png",
                  width: 30,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: 300,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: "inserisci la risposta",
                  iconColor: Colors.red,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.toLowerCase() == "nuvole") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("la risposta è giusta"),
                  ),
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondaScheda()));
                });
              } else {
                setState(() {
                  rispostaSbagliata++;
                  if (rispostaSbagliata == 3) {
                    stateButton = true;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("la risposta è sbagliata"),
                  ),
                );
              }
            },
            child: const Text("verifica la risposta"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ElevatedButton(
              onPressed: stateButton
                  ? () {
                      if (stateButton == true) {
                        setState(() {
                          risposta = "la riposta è nuvole";
                        });
                      }
                    }
                  : null,
              child: const Text("visualizza la risposta"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              risposta,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
