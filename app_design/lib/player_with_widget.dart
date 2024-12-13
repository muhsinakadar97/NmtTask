import 'package:flutter/material.dart';

class PlayerWithWidget extends StatefulWidget {
  const PlayerWithWidget({super.key});

  @override
  _PlayerWithWidgetState createState() => _PlayerWithWidgetState();
}

class _PlayerWithWidgetState extends State<PlayerWithWidget> {
  bool isFullScreen = false;

  // Method to toggle fullscreen mode for testing
  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Example')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Player Widget with a 16:9 aspect ratio
              Container(
                width: constraints.maxWidth,
                height: constraints.maxWidth * 9 / 16,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Player',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              // Only show the widget below the player if not in fullscreen
              if (!isFullScreen)
                Container(
                  color: Colors.orange,
                  height: 50,
                  child: const Center(
                    child: Text('Widget below Player',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleFullScreen,
        child: Icon(isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: PlayerWithWidget()));
}
