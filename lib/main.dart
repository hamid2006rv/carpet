import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carpet/result_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'service.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Carpet App',
    home: MyAPP(),
  ));
}

class MyAPP extends StatefulWidget {
  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  late CameraController controller;
  XFile? image;
  bool waiting = false;
  final Service service = Service();

  @override
  void initState() {
    super.initState();
    image = null;
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        print(e.description);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.value.isInitialized
          ? SafeArea(
              child: Stack(children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: CameraPreview(controller)),
                Positioned(
                    left: 10,
                    top: 20,
                    child: DottedBorder(
                      color: Colors.white,
                      strokeWidth: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 60,
                      ),
                    )),
                Positioned(
                  bottom: 10,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: image != null
                            ? Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )
                            : Text(''),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: waiting == false
                              ? InkWell(
                                  child: Icon(
                                    Icons.photo_camera,
                                    size: 55,
                                    color: Colors.white,
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      waiting = true;
                                    });
                                    controller!.takePicture().then((value) {
                                      setState(() {
                                        image = value;
                                      });
                                    });
                                    setState(() {
                                      waiting = false;
                                    });
                                  })
                              : Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ),
                        ),
                      ),
                      image == null
                          ? Text('')
                          : Container(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: InkWell(
                                  onTap: () async {
                                    var chk = await service.check_connection();
                                    if (chk == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Error: Unable to connect server, please check internet!',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        ),
                                        backgroundColor: Colors.red,
                                      ));
                                      return;
                                    }
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (contex) =>
                                                Result_page(image: image)));
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 45,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ]),
            )
          : Container(),
    );
  }
}
