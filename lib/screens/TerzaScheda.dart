import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SecondaScheda.dart';

class TerzaScheda extends StatefulWidget {
  const TerzaScheda({Key? key}) : super(key: key);

  @override
  State<TerzaScheda> createState() => _TerzaSchedaState();
}

class _TerzaSchedaState extends State<TerzaScheda> {
  final TextEditingController _controller = TextEditingController();
  int rispostaSbagliata = 0;
  String risposta = " ";
  bool stateButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("sfida 3/3"),
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
                    "images/alba1.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/alba2.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/alba3.png",
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    "images/alba4.png",
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
                  if (_controller.text.toLowerCase() == "alba") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("la risposta è giusta"),
                      ),
                    );
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
                    risposta = "la riposta è alba";
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
