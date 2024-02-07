import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press the button!',
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'The number is now $count',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent
              ),
            ),
            const SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    icon: const Icon(
                      Icons.plus_one,
                    ),
                    label: const Text('Add One')),
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    icon: const Icon(
                      Icons.exposure_minus_1,
                    ),
                    label: const Text('Minus One')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
