import 'package:counter_app/storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int value = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    value = await CounterStorage.getValue();
    setState(() {});
  }

  void increment() {
    setState(() {
      value++;
    });
    CounterStorage.saveValue(value);
  }

  void decrement() {
    setState(() {
      value--;
    });
    CounterStorage.saveValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Value : $value",
              style: GoogleFonts.yujiHentaiganaAkebono(
                color: const Color.fromARGB(255, 2, 2, 2),
                fontSize: 40,
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 147, 210, 240),
                  onPressed: () {
                    increment();
                  },
                  splashColor: const Color.fromARGB(255, 134, 108, 108),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 100),
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 147, 210, 240),
                  onPressed: () {
                    decrement();
                  },
                  splashColor: const Color.fromARGB(255, 134, 108, 108),
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
