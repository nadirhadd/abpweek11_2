import 'package:flutter/material.dart';

class Tutorial11_2Page extends StatefulWidget {
  const Tutorial11_2Page({Key? key}) : super(key: key);

  @override
  _Tutorial11_2PageState createState() => _Tutorial11_2PageState();
}

class _Tutorial11_2PageState extends State<Tutorial11_2Page> {
  final List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial 11-2'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    String newData = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: TextField(
            onChanged: (value) {
              newData = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter data',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _data.add(newData);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
