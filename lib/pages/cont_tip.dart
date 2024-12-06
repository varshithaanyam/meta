import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  List<Map<String, String>> tips = [
    {
      'tip': 'Validate your startup idea.',
      'details': 'Conduct thorough market research, create a minimum viable product (MVP), and gather feedback from potential customers.'
    },
    {
      'tip': 'Focus on solving real problems.',
      'details': 'Identify pain points in the market and provide solutions that address them effectively.'
    },
    {
      'tip': 'Build a strong network.',
      'details': 'Connect with mentors, industry experts, and like-minded entrepreneurs to gain insights and support.'
    },
  ];

  final TextEditingController _tipController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  void _addTip() {
    if (_tipController.text.isNotEmpty && _detailsController.text.isNotEmpty) {
      setState(() {
        tips.add({
          'tip': _tipController.text,
          'details': _detailsController.text,
        });
      });
      _tipController.clear();
      _detailsController.clear();
      Navigator.of(context).pop();
    }
  }

  void _showAddTipDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a Tip'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tipController,
                decoration: InputDecoration(labelText: 'Tip'),
              ),
              TextField(
                controller: _detailsController,
                decoration: InputDecoration(labelText: 'Details'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _addTip,
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Tips'),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(tips[index]['tip']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(tips[index]['details']!),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTipDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}