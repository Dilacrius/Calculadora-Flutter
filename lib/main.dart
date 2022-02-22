import 'package:flutter/material.dart';

// Nome: Gustavo Janebro da Cunha
// Desenvolvido a partir das atividades elaboradas no curso Dell Lead

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget customRadio_01(String txt, int index) {
    return OutlineButton(
      onPressed: () => changeIndex_01(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      borderSide: BorderSide(
          color: selectedIndex_01 == index ? Colors.cyan : Colors.grey),
      child: Text(txt),
    );
  }

  Widget customRadio_02(String txt, int index) {
    return OutlineButton(
      onPressed: () => changeIndex_02(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      borderSide: BorderSide(
          color: selectedIndex_02 == index ? Colors.cyan : Colors.grey),
      child: Text(txt),
    );
  }

  Widget customRadio_op(String txt, int index) {
    return OutlineButton(
      onPressed: () => changeIndex_op(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      borderSide: BorderSide(
          color: selectedIndex_op == index ? Colors.cyan : Colors.grey),
      child: Text(txt),
    );
  }

  void changeIndex_01(int index) {
    setState(() {
      selectedIndex_01 = index;
    });
  }

  void changeIndex_02(int index) {
    setState(() {
      selectedIndex_02 = index;
    });
  }

  void changeIndex_op(int index) {
    setState(() {
      selectedIndex_op = index;
    });
  }

  List<String> lst = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  List<String> op = ['+', '-', '*', '/'];
  double _valor_final = 0.0;
  int selectedIndex_01 = 0;
  int selectedIndex_02 = 0;
  int selectedIndex_op = 0;

  void _calcular() {
    setState(() {
       if (selectedIndex_02 == 0 || selectedIndex_01 == 0 || selectedIndex_op == 0){

       } else {
        if (op[selectedIndex_op-1] == '+') {
          _valor_final = double.parse(lst[selectedIndex_01-1]) + double.parse(lst[selectedIndex_02-1]);
        } if (op[selectedIndex_op-1] == '-') {
          _valor_final = double.parse(lst[selectedIndex_01-1]) - double.parse(lst[selectedIndex_02-1]);
        } if (op[selectedIndex_op-1] == '/') {
          _valor_final = double.parse(lst[selectedIndex_01-1]) / double.parse(lst[selectedIndex_02-1]);
        } if (op[selectedIndex_op-1] == '*') {
          _valor_final = double.parse(lst[selectedIndex_01-1]) * double.parse(lst[selectedIndex_02-1]);
        }
        _valor_final = double.parse((_valor_final).toStringAsFixed(2));
       };
    });
  }

  void _zerar() {
    setState(() {
      changeIndex_01(0);
      changeIndex_02(0);
      changeIndex_op(0);
      _valor_final = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_01(lst[0], 1),
                customRadio_01(lst[1], 2),
                customRadio_01(lst[2], 3),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_01(lst[3], 4),
                customRadio_01(lst[4], 5),
                customRadio_01(lst[5], 6),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_01(lst[6], 7),
                customRadio_01(lst[7], 8),
                customRadio_01(lst[8], 9),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_01(lst[9], 10),
              ],
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20.0,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_02(lst[0], 1),
                customRadio_02(lst[1], 2),
                customRadio_02(lst[2], 3),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_02(lst[3], 4),
                customRadio_02(lst[4], 5),
                customRadio_02(lst[5], 6),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_02(lst[6], 7),
                customRadio_02(lst[7], 8),
                customRadio_02(lst[8], 9),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_02(lst[9], 10),
              ],
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20.0,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customRadio_op(op[0], 1),
                customRadio_op(op[1], 2),
                customRadio_op(op[2], 3),
                customRadio_op(op[3], 4),
              ],
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20.0,
                ),
              ],
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resultado: $_valor_final',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: _calcular,
                  child: Text('Calcular'),
                ),

                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: _zerar,
                  child: Text('Zerar'),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
