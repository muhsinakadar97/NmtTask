import 'package:flutter/material.dart';

class AmazingPresentationPage extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Amazing Presentation'),
              background: Image.asset(
                'assets/images/app_logo.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverToBoxAdapter
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tips for an Amazing Presentation',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1. Know your audience.\n'
                    '2. Structure your content effectively.\n'
                    '3. Use visuals to enhance understanding.\n'
                    '4. Rehearse your delivery.\n'
                    '5. Be confident and engage your audience.',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Items List:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),

          // SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.star),
                  title: Text(items[index]),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
