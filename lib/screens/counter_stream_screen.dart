import 'package:flutter/material.dart';
import '../services/counter_stream_service.dart';


class CounterStreamScreen extends StatefulWidget {
  const CounterStreamScreen({super.key});

  @override
  State<CounterStreamScreen> createState() => _CounterStreamScreenState();
}

class _CounterStreamScreenState extends State<CounterStreamScreen> {
  late CounterStreamService _service;
  @override
  initState() {
    super.initState();
    _service = CounterStreamService();
  }
  void dispose() {
    _service.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Stream')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _service.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Số Lượng: ${snapshot.data}', style: const TextStyle(fontSize: 24));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  } 
}