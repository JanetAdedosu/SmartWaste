import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Sorter',
      debugShowCheckedModeBanner: false,
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
  final String imagePath; // Added

  WasteCategory(this.name, this.description, this.icon, this.color, this.imagePath);
}

class WasteDashboard extends StatelessWidget {
  final List<WasteCategory> categories = [
    WasteCategory("Recyclable", "Bottles, paper, cans", Icons.recycling, Colors.green, "assets/images/recyclable.png"),
    WasteCategory("Organic", "Food waste, plants", Icons.eco, Colors.brown, "assets/images/organic.png"),
    WasteCategory("Hazardous", "Batteries, chemicals", Icons.warning, Colors.red, "assets/images/Harzadous.png"),
    WasteCategory("E-Waste", "Phones, appliances", Icons.devices, Colors.blue, "assets/images/E-waste.png"),
    WasteCategory("General", "Wrappers, dirty tissues", Icons.delete, Colors.grey, "assets/images/General waste.png"),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WasteDetailScreen(category: cat),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(cat.icon, size: 40, color: cat.color),
                  SizedBox(height: 10),
                  Text(
                    cat.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    cat.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WasteDetailScreen extends StatelessWidget {
  final WasteCategory category;

  WasteDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(category.imagePath, height: 200),
            SizedBox(height: 20),
            Text(
              category.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: category.color),
            ),
            SizedBox(height: 10),
            Text(
              category.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
