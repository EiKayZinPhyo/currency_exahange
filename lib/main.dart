import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExchangePage(),
    );
  }
}

class ExchangePage extends StatefulWidget {
  ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  var result = '';
  String selectnum = "MMK";
  String selectnum1 = 'USD';

  void convertChange() {
    if (selectnum == 'USD' && selectnum1 == 'MMK') {
      result = '${int.parse(inputController.text) * 1843.76}';
      outputController.text = result;
    } else if (selectnum == 'USD' && selectnum1 == 'EUR') {
      result = '${int.parse(inputController.text) * 0.98}';
      outputController.text = result;
    } else if (selectnum == 'USD' && selectnum1 == 'THB') {
      result = '${int.parse(inputController.text) * 36.63}';
      outputController.text = result;
    } else if (selectnum == 'USD' && selectnum1 == 'EUR') {
      result = '${int.parse(inputController.text) * 0.98}';
      outputController.text = result;
      //MMk
    } else if (selectnum == 'MMK' && selectnum1 == 'EUR') {
      result = '${int.parse(inputController.text) * 0.00053}';
      outputController.text = result;
    } else if (selectnum == 'MMK' && selectnum1 == 'USD') {
      result = '${int.parse(inputController.text) * 0.00054}';
      outputController.text = result;
    } else if (selectnum == 'MMK' && selectnum1 == 'THB') {
      result = '${int.parse(inputController.text) * 0.020}';
      outputController.text = result;
    } else if (selectnum == 'MMK' && selectnum1 == 'MMK') {
      result = '${int.parse(inputController.text) * 1}';
      outputController.text = result;
      //Eur
    } else if (selectnum == 'EUR' && selectnum1 == 'EUR') {
      result = '${int.parse(inputController.text) * 1}';
      outputController.text = result;
    } else if (selectnum == 'EUR' && selectnum1 == 'USD') {
      result = '${int.parse(inputController.text) * 1.02}';
      outputController.text = result;
    } else if (selectnum == 'EUR' && selectnum1 == 'THB') {
      result = '${int.parse(inputController.text) * 37.41}';
      outputController.text = result;
    } else if (selectnum == 'EUR' && selectnum1 == 'MMK') {
      result = '${int.parse(inputController.text) * 1883.03}';
      outputController.text = result;
      //thb
    } else if (selectnum == 'THB' && selectnum1 == 'EUR') {
      result = '${int.parse(inputController.text) * 0.027}';
      outputController.text = result;
    } else if (selectnum == 'THB' && selectnum1 == 'USD') {
      result = '${int.parse(inputController.text) * 0.027}';
      outputController.text = result;
    } else if (selectnum == 'THB' && selectnum1 == 'MMK') {
      result = '${int.parse(inputController.text) * 50.33}';
      outputController.text = result;
    } else if (selectnum == 'THB' && selectnum1 == 'THB') {
      result = '${int.parse(inputController.text) * 1}';
      outputController.text = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text("Curreny_Exchange"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 180,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: inputController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: selectnum,
                  items:
                      <String>['MMK', 'USD', "EUR", 'THB'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(
                    () {
                      selectnum = value.toString();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 180,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: outputController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: selectnum1,
                  items:
                      <String>['MMK', 'USD', "EUR", 'THB'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(
                    () {
                      selectnum1 = value.toString();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    convertChange();
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
