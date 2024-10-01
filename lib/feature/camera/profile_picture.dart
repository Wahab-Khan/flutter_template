import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/feature/camera/take_profile_picture.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  List<CameraDescription>? cameras;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAvailableCameras();
  }

  Future<void> _getAvailableCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print(
          "code : ${e.code}  \n discription : ${e.description}"); // Handle camera errors (optional)
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () async {
              if (cameras != null && cameras!.isNotEmpty) {
                final camera = cameras!.last;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(camera: camera),
                  ),
                );
              } else {
                // Handle no camera case (optional)
                print('No cameras available');
              }
            },
            child: CircleAvatar(
              minRadius: 50,
              maxRadius: 100,
              backgroundColor: Colors.red,
              child: Icon(Icons.person),
            ),
          ),
        ),
      ),
    );
  }
}
