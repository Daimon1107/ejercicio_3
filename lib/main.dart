import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MultiplicadorRomanos(),
  ));
}

class MultiplicadorRomanos extends StatefulWidget {
  @override
  _MultiplicadorRomanosState createState() => _MultiplicadorRomanosState();
}

class _MultiplicadorRomanosState extends State<MultiplicadorRomanos> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  String resultadoDecimal = '';
  String resultadoRomano = '';

  final Map<String, int> _romanMap = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  // Convertir Romano a Decimal
  int romanToDecimal(String roman) {
    int result = 0;
    int prevValue = 0;

    for (int i = roman.length - 1; i >= 0; i--) {
      int value = _romanMap[roman[i]] ?? 0;
      if (value < prevValue) {
        result -= value;
      } else {
        result += value;
        prevValue = value;
      }
    }
    return result;
  }

  // Convertir Decimal a Romano
  String decimalToRoman(int num) {
    List<MapEntry<String, int>> romanList = [
      MapEntry('M', 1000),
      MapEntry('CM', 900),
      MapEntry('D', 500),
      MapEntry('CD', 400),
      MapEntry('C', 100),
      MapEntry('XC', 90),
      MapEntry('L', 50),
      MapEntry('XL', 40),
      MapEntry('X', 10),
      MapEntry('IX', 9),
      MapEntry('V', 5),
      MapEntry('IV', 4),
      MapEntry('I', 1),
    ];

    String result = '';
    for (var entry in romanList) {
      while (num >= entry.value) {
        result += entry.key;
        num -= entry.value;
      }
    }
    return result;
  }

  // Validar si es un número romano correcto (simplificado)
  bool isRomanValid(String roman) {
    final regex = RegExp(r'^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$');
    return regex.hasMatch(roman.toUpperCase());
  }

  void multiplicar() {
    String r1 = _controller1.text.toUpperCase();
    String r2 = _controller2.text.toUpperCase();
    String r3 = _controller3.text.toUpperCase();

    if (r1.isEmpty || r2.isEmpty || r3.isEmpty) {
      _showError('Por favor llena los tres campos.');
      return;
    }

    if (!isRomanValid(r1) || !isRomanValid(r2) || !isRomanValid(r3)) {
      _showError('Uno o más números romanos no son válidos.');
      return;
    }

    int n1 = romanToDecimal(r1);
    int n2 = romanToDecimal(r2);
    int n3 = romanToDecimal(r3);

    int resultado = n1 * n2 * n3;

    if (resultado > 3999) {
      _showError('El resultado excede 3999.');
      return;
    }

    setState(() {
      resultadoDecimal = resultado.toString();
      resultadoRomano = decimalToRoman(resultado);
    });
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiplicador de Romanos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: InputDecoration(labelText: 'Primer número romano'),
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(labelText: 'Segundo número romano'),
            ),
            TextField(
              controller: _controller3,
              decoration: InputDecoration(labelText: 'Tercer número romano'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: multiplicar,
              child: Text('Multiplicar'),
            ),
            SizedBox(height: 20),
            Text('Resultado Decimal: $resultadoDecimal'),
            Text('Resultado Romano: $resultadoRomano'),
          ],
        ),
      ),
    );
  }
}
