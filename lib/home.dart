import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = " ";

  Widget btn(var text) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + text;
          });
        },
        child: Text(text));
  }

  clear() {
    setState(() {
      result = " ";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("4"),
                Text("\n\n"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("5"),
                btn("6"),
                btn("7"),
                btn("8"),
                Text("\n\n"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("9"),
                btn("0"),
                btn("+"),
                btn("-"),
                Text("\n\n"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("*"),
                btn("/"),
                ElevatedButton(onPressed: clear, child: Text("clear")),
                ElevatedButton(onPressed: output, child: Text("=")),
                Text("\n\n"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
