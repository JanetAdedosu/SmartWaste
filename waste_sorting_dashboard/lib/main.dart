import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste Sorter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WasteDashboard(),
    );
  }
}

class WasteCategory {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  WasteCategory(this.name, this.description, this.icon, this.color);
}

class WasteDashboard extends StatelessWidget {
  final List<WasteCategory> categories = [
    WasteCategory("Recyclable", "Bottles, paper, cans", Icons.recycling, Colors.green),
    WasteCategory("Organic", "Food waste, plants", Icons.eco, Colors.brown),
    WasteCategory("Hazardous", "Batteries, chemicals", Icons.warning, Colors.red),
    WasteCategory("E-Waste", "Phones, appliances", Icons.devices, Colors.blue),
    WasteCategory("General", "Wrappers, dirty tissues", Icons.delete, Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Waste Categories")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Card(
            color: cat.color.withOpacity(0.2),
            child: InkWell(
              onTap: () {
                // Future: Navigate to detail screen
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(cat.icon, size: 40, color: cat.color),
                  SizedBox(height: 10),
                  Text(cat.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(cat.description, textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
