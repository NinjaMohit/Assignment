import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  // Use a List<int> to store counts for each item
  final List<int> _counts = List.generate(100, (_) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List with Persistent Counts'),
      ),
      body: ListView.builder(
        itemCount: _counts.length,
        itemBuilder: (context, index) => ListItemWidget(
          count: _counts[index],
          onIncrement: () {
            setState(() {
              _counts[index]++;
            });
          },
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;

  const ListItemWidget({required this.count, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: onIncrement,
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
