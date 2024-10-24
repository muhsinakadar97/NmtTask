
import 'package:flutter/material.dart';

class ItemSelector extends StatefulWidget {
  const ItemSelector({super.key});

  @override
  _ItemSelectorState createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select an Item:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    selected: selectedIndex == index,
                    tileColor: selectedIndex == index ? Colors.blue[100] : null,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (selectedIndex != null) ...[
              // const Text(
              //   'Selected Items:',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length - selectedIndex! - 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[selectedIndex! + index + 1]),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}