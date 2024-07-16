import 'package:fashion_lens/api/service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:fashion_lens/main.dart';
import 'package:http/http.dart' as http;

class DeteksiFashionLens extends StatefulWidget {
  @override
  _DeteksiFashionLensState createState() => _DeteksiFashionLensState();
}

class _DeteksiFashionLensState extends State<DeteksiFashionLens> {
  CameraController? controller;
  late Timer _timer;
  Uint8List? _imageBytes;
  bool _processingFrame = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
      if (!controller!.value.isStreamingImages && !_processingFrame) {
        processFrame();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller?.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    if (cameras != null && cameras!.isNotEmpty) {
      controller = CameraController(cameras![1], ResolutionPreset.medium);
      try {
        await controller!.initialize();
      } catch (e) {
        print('Error initializing camera: $e');
      }
      if (!mounted) return;
      setState(() {});
    } else {
      print('No cameras found');
    }
  }

  Future<void> processFrame() async {
    if (controller == null || !controller!.value.isInitialized) {
      print('Camera is not initialized');
      return;
    }

    _processingFrame = true;

    try {
      XFile picture = await controller!.takePicture();
      Uint8List bytes = await picture.readAsBytes();
      String base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse(AppServices.getDeteksiEndpoint()), // Update this line with your actual endpoint
        body: {'frame': base64Image},
      );

      if (response.statusCode == 200) {
        setState(() {
          _imageBytes = base64Decode(jsonDecode(response.body)['frame']);
        });
      } else {
        print('Failed to process frame, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error processing frame: $e');
    }

    _processingFrame = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Lens'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _imageBytes != null
                ? Image.memory(
                    _imageBytes!,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!_processingFrame) {
                setState(() {});
              }
            },
            child: Text('Process Frame'),
          ),
        ],
      ),
    );
  }
}