import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quattro_immagini_una_parola/screens/TerzaScheda.dart';

import 'SecondaScheda.dart';

class SecondaScheda extends StatefulWidget {
  const SecondaScheda({Key? key}) : super(key: key);

  @override
  State<SecondaScheda> createState() => _SecondaSchedaState();
}

class _SecondaSchedaState extends State<SecondaScheda> {
  final TextEditingController _controller = TextEditingController();
  int rispostaSbagliata = 0;
  String risposta = " ";
  bool stateButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("sfida 2/3"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                padding: const EdgeInsets.all(7),
                children: [
                  Image.asset(
                    "images/castelli1.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/castelli2.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/castelli3.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/castelli4.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: 300,
                alignment: Alignment.center,
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "inserisci la risposta",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.toLowerCase() == "castelli") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("la risposta è giusta"),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TerzaScheda()));
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
            ),
            ElevatedButton(
              onPressed: stateButton
                  ? () {
                if (stateButton == true) {
                  setState(() {
                    risposta = "la riposta è castelli";
                  });
                }
              }
                  : null,
              child: const Text("visualizza la risposta"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                risposta,
                style: const TextStyle(
                  fontSize: 21,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
