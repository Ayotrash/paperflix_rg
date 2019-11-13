import 'dart:async';
import 'dart:io' show File, Platform;
import 'package:dio/dio.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/screens/new_resume/new_resume.dart';
import 'package:path/path.dart' as path;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperflix_rg/helpers/navigation_animation.dart';
import 'package:paperflix_rg/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './register.dart';

abstract class RegisterViewModel extends State<Register> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool terms = false;
  bool isLoading = false;

  bool errorFirstname = false;
  bool errorLastname = false;
  bool errorEmail = false;
  bool errorEmailNotFill = false;
  bool errorPassword = false;
  bool errorConfirm = false;
  String messageFirstname = "";
  String messageLastname = "";
  String messageEmail = "";
  String messagePassword = "";
  String messageConfirm = "";

  Map deviceInfo = Map();

  File image;
  String imageUrl;

  int securityButton = 0;
  String passwordBcrypt;

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future getDeviceInfo() async {
    DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      setState(() {
        deviceInfo = {
          "version": {
            "baseOS": androidInfo.version.baseOS,
            "codename": androidInfo.version.codename,
            "incremental": androidInfo.version.incremental,
            "previewSdkInt": androidInfo.version.previewSdkInt,
            "release": androidInfo.version.release,
            "sdkInt": androidInfo.version.sdkInt,
            "securityPatch": androidInfo.version.securityPatch,
          },
          "board": androidInfo.board,
          "bootloader": androidInfo.bootloader,
          "brand": androidInfo.brand,
          "device": androidInfo.device,
          "display": androidInfo.display,
          "fingerprint": androidInfo.fingerprint,
          "hardware": androidInfo.hardware,
          "host": androidInfo.host,
          "id": androidInfo.id,
          "manufacturer": androidInfo.manufacturer,
          "model": androidInfo.model,
          "product": androidInfo.product,
          "supported32BitAbis": androidInfo.supported32BitAbis,
          "supported64BitAbis": androidInfo.supported64BitAbis,
          "supportedAbis": androidInfo.supportedAbis,
          "tags": androidInfo.tags,
          "type": androidInfo.type,
          "isPhysicalDevice": androidInfo.isPhysicalDevice,
          "deviceId": androidInfo.androidId,
        };
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      setState(() {
        deviceInfo = {
          "name": iosInfo.name,
          "systemName": iosInfo.systemName,
          "systemVersion": iosInfo.systemVersion,
          "model": iosInfo.model,
          "localizedModel": iosInfo.localizedModel,
          "deviceId": iosInfo.identifierForVendor,
          "isPhysicalDevice": iosInfo.isPhysicalDevice,
          "utsname": iosInfo.utsname,
        };
      });
    }
  }

  // void registerDialog(context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Alert Dialog title"),
  //         content: new Text("Alert Dialog body"),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("Close"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future onBtnRegisterPressed() async {
    if (firstnameController.text.length <= 0 ||
        firstnameController.text == null) {
      setState(() {
        errorFirstname = true;
        messageFirstname = "Firstname must be filled in";
      });
    } else if (lastnameController.text.length <= 0 ||
        lastnameController.text == null) {
      setState(() {
        errorLastname = true;
        messageLastname = "Lastname must be filled in";
      });
    } else if (emailController.text.length <= 0 ||
        emailController.text == null) {
      setState(() {
        errorEmailNotFill = true;
        messageEmail = "Email must be filled in";
      });
    } else if (passwordController.text.length < 8 ||
        passwordController.text == null) {
      setState(() {
        errorPassword = true;
        messagePassword = "Password must be more than 8 characters";
      });
    } else if (confirmPasswordController.text.length < 8 ||
        confirmPasswordController.text == null ||
        confirmPasswordController.text != passwordController.text) {
      setState(() {
        errorConfirm = true;
        messageConfirm = "Password not match";
      });
    } else {
      setState(() {
        errorPassword = false;
        errorConfirm = false;
        errorFirstname = false;
        errorLastname = false;
        errorEmailNotFill = false;
      });
      if (securityButton == 0) {
        toggleLoading();
        register();
      }
    }
  }

  Future register() async {
    var salt10 = await FlutterBcrypt.saltWithRounds(rounds: 10);
    String bcrypt = await FlutterBcrypt.hashPw(
        password: passwordController.text, salt: salt10);
    Response response = await Providers.register(
        firstname: firstnameController.text,
        lastname: lastnameController.text,
        email: emailController.text,
        avatar: imageUrl == null
            ? this.widget.gender == 0
                ? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572640034110.jpg?alt=media&token=f808358e-67e0-4edf-a147-eabc98abacd6"
                : "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"
            : imageUrl,
        gender: this.widget.gender == 0 ? "female" : "male",
        password: bcrypt,
        deviceInfo: deviceInfo);

    if (response.statusCode == 201) {
      setState(() {
        passwordBcrypt = bcrypt;
        errorEmail = false;
        securityButton++;
      });
      loginFunc();
    } else if (response.statusCode == 405) {
      toggleLoading();
      setState(() {
        errorEmail = true;
      });
    }
  }

  Future loginFunc() async {
    _firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordBcrypt)
        .then((AuthResult result) async {
      //declare
      SharedPreferences prefs = await SharedPreferences.getInstance();
      FirebaseUser user = result.user;

      //set localstorage
      await prefs.setString("uidUser", "${user.uid}");
      await prefs.setBool('isLogin', true);
      print(user.uid);

      //clean form
      toggleLoading();
      setState(() {
        passwordBcrypt = null;
      });

      //Navigator push
      Navigator.pushAndRemoveUntil(
          context,
          NavigationRoute(
              enterPage: NewResume(
            firstname: "${firstnameController.text}",
            lastname: "${lastnameController.text}",
            email: "${emailController.text}",
            gender: this.widget.gender == 0 ? "female" : "male",
            avatar: imageUrl == null
                ? this.widget.gender == 0
                    ? "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572640034110.jpg?alt=media&token=f808358e-67e0-4edf-a147-eabc98abacd6"
                    : "https://firebasestorage.googleapis.com/v0/b/paperflix-company.appspot.com/o/avatars%2Fimage_cropper_1572639988980.jpg?alt=media&token=5ab82802-bb96-4c7d-8b26-647c55e82aa7"
                : imageUrl,
          )),
          ModalRoute.withName('/Auth'));
    }).catchError((err) {
      print(err);
      toggleLoading();
    });
  }

  // void toastErrorMsg(String message) {
  //   Toast.show("$message", context,
  //       backgroundColor: Color(0xFFff4757),
  //       textColor: Colors.white,
  //       duration: Toast.LENGTH_SHORT,
  //       gravity: Toast.BOTTOM);
  // }

  void imageSelect(context) {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext context) {
          return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          await getImage(1);
                          await cropImage();
                          Navigator.pop(context);
                          await pickSaveImage();
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: RaisedButton(
                              color: Color(0xFF282828),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await getImage(1);
                                await cropImage();
                                Navigator.pop(context);
                                await pickSaveImage();
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text("Select from Camera"),
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () async {
                          await getImage(0);
                          await cropImage();
                          Navigator.pop(context);
                          await pickSaveImage();
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: RaisedButton(
                              color: Color(0xFF282828),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await getImage(0);
                                await cropImage();
                                Navigator.pop(context);
                                await pickSaveImage();
                              },
                              child: Icon(
                                Icons.photo_library,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text("Select from Gallery"),
                        ),
                      ),
                    ],
                  )));
        });
  }

  Future getImage(int type) async {
    try {
      var _image = await ImagePicker.pickImage(
          source: type == 0 ? ImageSource.gallery : ImageSource.camera);

      setState(() {
        image = _image;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<Null> cropImage() async {
    try {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        maxWidth: 512,
        maxHeight: 512,
      );

      setState(() {
        image = croppedFile;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<void> pickSaveImage() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: "${USERUPLOADER['email']}",
              password: "${USERUPLOADER['password']}")
          .then((AuthResult result) async {
        String imageFile = path.basename(image.path);
        StorageReference ref =
            FirebaseStorage.instance.ref().child("avatars").child(imageFile);
        StorageUploadTask uploadTask = ref.putFile(image);

        String _imageUrl =
            await (await uploadTask.onComplete).ref.getDownloadURL();
        setState(() {
          imageUrl = _imageUrl;
        });
        _firebaseAuth.signOut();
      }).catchError((err) {
        print(err);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDeviceInfo();
    });
  }
}
