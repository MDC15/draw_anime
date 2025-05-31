import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ar_provider.dart';
import 'ar_widget.dart';

class ArPage extends StatefulWidget {
  const ArPage({super.key});

  @override
  State<ArPage> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArProvider>().initializeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('AR Drawing'),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.flip_camera_ios),
                onPressed: provider.switchCamera,
              ),
            ],
          ),
          body: Stack(
            children: [
              // Camera Preview
              const ArCameraPreview(),

              // Overlay Canvas
              if (provider.selectedAnimeImage != null)
                ArOverlayCanvas(
                  animeImage: provider.selectedAnimeImage!,
                  onDrawingUpdate: provider.addDrawingPoint,
                ),

              // Bottom Controls
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ArControlPanel(
                  onImageSelect: provider.selectAnimeImage,
                  onCapture: provider.captureImage,
                  onClearDrawing: provider.clearDrawing,
                  isLoading: provider.isLoading,
                ),
              ),

              // Loading Indicator
              if (provider.isLoading)
                Container(
                  color: Colors.black.withAlpha(05),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
