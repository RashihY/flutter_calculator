// IM/2021/048 - H.R.Y.Gunathilaka

import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> history;
  final VoidCallback onClearHistory;

  const HistoryScreen({
    Key? key,
    required this.history,
    required this.onClearHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // History screen
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onClearHistory();      // Clear history
              Navigator.pop(context);    // Goes to previous page
            },
          ),
        ],
      ),
      body: history.isEmpty
          ? const Center(
        child: Text(
          'No history available',
          style: TextStyle(color: Colors.white),
        ),
      )

      // Current history
          : ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              history[index],
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
