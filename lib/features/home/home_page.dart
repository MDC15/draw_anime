import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_provider.dart';
import 'anime_canvas.dart';
import 'tool_panel.dart';
import '../user/user_page.dart';
import '../ar_overlay/ar_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Draw Anime'),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ArPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const UserPage()),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: AnimeCanvas(
                  drawings: provider.drawings,
                  currentTool: provider.currentTool,
                  currentColor: provider.currentColor,
                  onDrawingUpdate: provider.addDrawing,
                ),
              ),
              ToolPanel(
                currentTool: provider.currentTool,
                currentColor: provider.currentColor,
                onToolChanged: provider.setCurrentTool,
                onColorChanged: provider.setCurrentColor,
                onUndo: provider.undo,
                onRedo: provider.redo,
                onClear: provider.clearCanvas,
                canUndo: provider.canUndo,
                canRedo: provider.canRedo,
              ),
            ],
          ),
        );
      },
    );
  }
}
