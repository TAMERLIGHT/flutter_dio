import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'qr_scanner_page.dart';
import 'maps_page.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Ticker _ticker;
  late String _greeting;
  late DateTime _currentTime;

  @override
  void initState() {
    _currentTime = DateTime.now();
    _updateGreeting(_currentTime);
    _ticker = createTicker((elapsed) {
      _currentTime = DateTime.now();
      _updateGreeting(_currentTime);
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateGreeting(DateTime time) {
    final hour = time.hour;
    final minute = time.minute;
    String minuteString = minute.toString().padLeft(2, '0');
    if (hour >= 5 && hour < 12) {
      setState(() {
        _greeting = 'Доброе утро, сейчас $hour:$minuteString';
      });
    } else if (hour >= 12 && hour < 18) {
      setState(() {
        _greeting = 'Добрый день, сейчас $hour:$minuteString';
      });
    } else {
      setState(() {
        _greeting = 'Доброй ночи, сейчас $hour:$minuteString';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Главная",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _greeting,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScannerPage()),
                    );
                  },
                  icon: const Icon(Icons.qr_code),
                  label: const Text("QR-код"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapsPage()),
                    );
                  },
                  icon: const Icon(Icons.map),
                  label: const Text("Карта"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalculatorPage()),
                );
              },
              icon: const Icon(Icons.calculate),
              label: const Text("Калькулятор"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
