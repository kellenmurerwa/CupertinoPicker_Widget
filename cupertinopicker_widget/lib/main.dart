import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertinoPicker Widget',
      home: CupertinoPickerWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CupertinoPickerWidget extends StatefulWidget {
  @override
  _CupertinoPickerWidgetState createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  int selectedIndex = 0;
  
  final List<String> items = [
    'Apple',
    'Banana', 
    'Orange',
    'Grape',
    'Cherries',
    '🍉',
    '🥭🥭'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoPicker Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Display selected item
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selected: ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      items[selectedIndex],
                      style: TextStyle(fontSize: 20, color: Colors.blue[800]),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            Text(
              'Choose your favorite fruit:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            
            SizedBox(height: 20),
            
            // -----------------------The CupertinoPicker-------------------------
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),

              
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 50,
                magnification: 1.2,
                useMagnifier: true,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  
                },
                children: items.map((item) => Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )).toList(),
              ),
            ),
            
            SizedBox(height: 30),
            
            
          ],
        ),
      ),
    );
  }
}