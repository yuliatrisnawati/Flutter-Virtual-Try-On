import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class FemaleJacket extends StatefulWidget {
  @override
  _FemaleJacketState createState() => _FemaleJacketState();
}

class _FemaleJacketState extends State<FemaleJacket> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  Future<void>? _initializeControllerFuture;
  String? _selectedImagePath;
  Uint8List? _processedImageBytes;
  bool _processingFrame = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![1],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller?.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> processFrame() async {
    if (_controller == null || !_controller!.value.isInitialized || _processingFrame) {
      return;
    }

    _processingFrame = true;

    try {
      XFile picture = await _controller!.takePicture();
      Uint8List bytes = await picture.readAsBytes();
      String base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse('http://172.20.10.2:5000/pose_estimation'), // Ganti dengan endpoint sebenarnya
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'frame': base64Image}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _processedImageBytes = base64Decode(jsonDecode(response.body)['pose_landmarks']);
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
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_controller != null)
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Positioned.fill(
                    child: Stack(
                      children: [
                        CameraPreview(_controller!),
                        if (_processedImageBytes != null)
                          Positioned.fill(
                            child: Image.memory(
                              _processedImageBytes!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (_selectedImagePath != null)
                          Positioned(
                            top: 100, // Adjust this value to move the image up
                            left: (MediaQuery.of(context).size.width - 300) / 2, // Center the image horizontally
                            child: Image.asset(
                              _selectedImagePath!,
                              width: 300,
                              height: 450,
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 12, 20, 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 1, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 1.1, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 470, 5, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildJacketContainer(
                            'assets/images/women/female_jacket_1.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                          buildJacketContainer(
                            'assets/images/women/female_jacket_2.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                          buildJacketContainer(
                            'assets/images/women/female_jacket_3.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                          buildJacketContainer(
                            'assets/images/women/female_jacket_4.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                          buildJacketContainer(
                            'assets/images/women/female_jacket_5.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                          buildJacketContainer(
                            'assets/images/women/female_jacket_6.png',
                            (imagePath) {
                              setState(() {
                                _selectedImagePath = imagePath;
                                processFrame();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildClothingContainer(
                          'assets/images/jacket.png', Color(0xFFF6A0A0)),
                      buildClothingContainer(
                          'assets/images/wedding_dress.png', Color(0xFFD7E4F2)),
                      buildClothingContainer(
                          'assets/images/jeans.png', Color(0xFFFBCFBB)),
                      buildClothingContainer(
                          'assets/images/skirt.png', Color(0xFFD7E4F2)),
                      buildClothingContainer(
                          'assets/images/womens_blouse.png', Color(0xFFFBCFBB)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 40.5, 0),
                  child: SizedBox(
                    width: 209.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildIconContainer('assets/vectors/group_7_x2.svg', 95,
                            59, Color(0xFFDAEAF1)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 20.7, 0, 19.7),
                            width: 15,
                            height: 18.7,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_85_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/maleorfemale');
              },
              child: Container(
                width: 13.7,
                height: 23.3,
                child: SvgPicture.asset(
                  'assets/vectors/vector_24_x2.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJacketContainer(String imagePath, Function(String) onTap) {
    return GestureDetector(
      onTap: () => onTap(imagePath),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 110,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment(0.539, -0.135),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0xB2FBCFBB), Color(0xB2D7E4F2)],
                  stops: <double>[0, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 7,
              bottom: 0,
              child: Container(
                width: 97,
                height: 143,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClothingContainer(String assetPath, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (assetPath == 'assets/images/wedding_dress.png') {
            Navigator.pushNamed(context, '/femaledress');
          } else if (assetPath == 'assets/images/jeans.png') {
            Navigator.pushNamed(context, '/femaleshort');
          } else if (assetPath == 'assets/images/skirt.png') {
            Navigator.pushNamed(context, '/femaleskirt');
          } else if (assetPath == 'assets/images/womens_blouse.png') {
            Navigator.pushNamed(context, '/femaleblouse');
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(22.5),
          ),
          child: Container(
            height: 45,
            padding: EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(assetPath),
                ),
              ),
              width: 35,
              height: 35,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconContainer(
      String assetPath, double width, double height, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.fromLTRB(1, 17.8, 0, 18.8),
        child: Container(
          width: 30,
          height: 22.5,
          child: SvgPicture.asset(
            assetPath,
          ),
        ),
      ),
    );
  }
}
