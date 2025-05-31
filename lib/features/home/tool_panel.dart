import 'package:flutter/material.dart';
import 'home_model.dart';

class ToolPanel extends StatelessWidget {
  final DrawingTool currentTool;
  final Color currentColor;
  final Function(DrawingTool) onToolChanged;
  final Function(Color) onColorChanged;
  final VoidCallback onUndo;
  final VoidCallback onRedo;
  final VoidCallback onClear;
  final bool canUndo;
  final bool canRedo;

  const ToolPanel({
    super.key,
    required this.currentTool,
    required this.currentColor,
    required this.onToolChanged,
    required this.onColorChanged,
    required this.onUndo,
    required this.onRedo,
    required this.onClear,
    required this.canUndo,
    required this.canRedo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(01),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Tool Selection
          Row(
            children: [
              _buildToolButton(
                icon: Icons.brush,
                isSelected: currentTool == DrawingTool.brush,
                onPressed: () => onToolChanged(DrawingTool.brush),
              ),
              const SizedBox(width: 8),
              _buildToolButton(
                icon: Icons.cleaning_services,
                isSelected: currentTool == DrawingTool.eraser,
                onPressed: () => onToolChanged(DrawingTool.eraser),
              ),
            ],
          ),

          // Color Picker
          GestureDetector(
            onTap: () => _showColorPicker(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: currentColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),

          // Actions
          Row(
            children: [
              _buildActionButton(
                icon: Icons.undo,
                onPressed: canUndo ? onUndo : null,
              ),
              const SizedBox(width: 8),
              _buildActionButton(
                icon: Icons.redo,
                onPressed: canRedo ? onRedo : null,
              ),
              const SizedBox(width: 8),
              _buildActionButton(
                icon: Icons.clear,
                onPressed: onClear,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : null,
        foregroundColor: isSelected ? Colors.white : null,
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        foregroundColor: onPressed != null ? null : Colors.grey,
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Color'),
        content: SizedBox(
          width: 300,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _colors.length,
            itemBuilder: (context, index) {
              final color = _colors[index];
              return GestureDetector(
                onTap: () {
                  onColorChanged(color);
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static const List<Color> _colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.cyan,
    Colors.lime,
  ];
}
