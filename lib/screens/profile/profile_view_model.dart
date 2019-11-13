import 'dart:math';
import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperflix_rg/config/config.dart';
import 'package:paperflix_rg/screens/profile/widgets/add_data_profile.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import './profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  final db = Firestore.instance;
  File image;
  String imageUrl;
  List colors = [
    0xFFff4757,
    0xFF2ed573,
    0xFFffa502,
    0xFFff6b81,
    0xFF1e90ff,
    0xFF3742fa
  ];
  Random random = new Random();

  List employmentList = List();
  List educationList = List();
  List referencesList = List();
  List skillsList = List();
  List languagesList = List();
  List outSchoolActivitiesList = List();
  List hobbiesList = List();
  List coursesList = List();
  List socialList = List();

  void fetchLocalStorage() {
    storage.ready.then((_) {
      Map _userProfile = Map();
      _userProfile = storage.getItem('userProfile');
      print(_userProfile);
      setState(() {
        employmentList = _userProfile['employment'] ?? List();
        educationList = _userProfile['education'] ?? List();
        skillsList = _userProfile['skills'] ?? List();
        languagesList = _userProfile['languages'] ?? List();
        outSchoolActivitiesList =
            _userProfile['out_school_activities'] ?? List();
        hobbiesList = _userProfile['hobbies'] ?? List();
        referencesList = _userProfile['references'] ?? List();
        coursesList = _userProfile['courses'] ?? List();
        socialList = _userProfile['socials'] ?? List();
      });
    });
  }

  void setData(type, data) {
    if (type == 0) {
      setState(() {
        employmentList.add(data);
      });
      uploadData();
    } else if (type == 1) {
      setState(() {
        outSchoolActivitiesList.add(data);
      });
      uploadData();
    } else if (type == 2) {
      setState(() {
        educationList.add(data);
      });
      uploadData();
    } else if (type == 3) {
      setState(() {
        coursesList.add(data);
      });
      uploadData();
    } else if (type == 4) {
      setState(() {
        referencesList.add(data);
      });
      uploadData();
    } else if (type == 5) {
      setState(() {
        skillsList.add(data);
      });
      uploadData();
    } else if (type == 6) {
      setState(() {
        languagesList.add(data);
      });
      uploadData();
    } else if (type == 7) {
      setState(() {
        socialList.add(data);
      });
      uploadData();
    } else if (type == 8) {
      setState(() {
        hobbiesList.add(data);
      });
      uploadData();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocalStorage();
  }

  // void removeData(type, id) {
  //   if (type == 0) {
  //     setState(() {
  //       employmentList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Employment Success");
  //   } else if (type == 1) {
  //     setState(() {
  //       outSchoolActivitiesList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Out School Activities Success");
  //   } else if (type == 2) {
  //     setState(() {
  //       educationList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Education Success");
  //   } else if (type == 3) {
  //     setState(() {
  //       coursesList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Course Success");
  //   } else if (type == 4) {
  //     setState(() {
  //       referencesList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Reference Success");
  //   } else if (type == 5) {
  //     setState(() {
  //       skillsList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Skill Success");
  //   } else if (type == 6) {
  //     setState(() {
  //       languagesList.removeWhere((item) => item['id'] == id);
  //     });
  //     toastMsg("Delete Language Success");
  //   } else if (type == 7) {
  //     setState(() {
  //       socialList.removeWhere((item) => item['type'] == id);
  //     });
  //     toastMsg("Delete Social Success");
  //   } else if (type == 8) {
  //     setState(() {
  //       hobbiesList.removeWhere((item) => item == id);
  //     });
  //     toastMsg("Delete Hobby Success");
  //   }
  // }

  void imageSelect(context, {bool ref: false}) {
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
                          await uploadData();
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
                                await uploadData();
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
                          await uploadData();
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
                                await uploadData();
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

  Future<void> uploadData() async {
    // toggleLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      db
          .collection("users")
          .where("authentication_uid",
              isEqualTo: "${prefs.getString("uidUser")}")
          .snapshots()
          .listen((data) {
        if (data.documents.length > 0) {
          print('docId: ${data.documents[0].documentID}');
          updateFirestore(data);
        } else {
          print("error bos!");
          // toggleLoading(false);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void updateFirestore(data) {
    try {
      Map _temp = {
        "firstname": data.documents[0]['firstname'],
        "lastname": data.documents[0]['lastname'],
        "avatar": imageUrl ?? data.documents[0]['avatar'],
        "email": data.documents[0]['email'],
        "gender": data.documents[0]['gender'],
        "bod": data.documents[0]['bod'],
        "place_of_birth": data.documents[0]['place_of_birth'],
        "country_code": data.documents[0]['country_code'],
        "phone": data.documents[0]['phone'],
        "job_title": data.documents[0]['job_title'],
        "country": data.documents[0]['country'],
        "province": data.documents[0]['province'],
        "city": data.documents[0]['city'],
        "address": data.documents[0]['address'],
        "nationality": data.documents[0]['nationality'],
        "driving_licenses": data.documents[0]['driving_licenses'],
        "about_you": data.documents[0]['about_you'],
        "employment": employmentList ?? [],
        "education": educationList ?? [],
        "skills": skillsList ?? [],
        "languages": languagesList ?? [],
        "out_school_activities": outSchoolActivitiesList ?? [],
        "references": referencesList ?? [],
        "hobbies": hobbiesList ?? [],
        "courses": coursesList ?? [],
        "socials": socialList ?? []
      };

      db
          .collection('users')
          .document('${data.documents[0].documentID}')
          .updateData(Map<String, dynamic>.from(_temp))
          .then((res) {
        print("Update ${data.documents[0]['email']} Success");

        storage.setItem('userProfile', Map<String, dynamic>.from(_temp));
        print(storage.getItem('userProfile'));
      }).catchError((err) {
        print(err);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickSaveImage() async {
    try {
      String imageFile = path.basename(image.path);
      StorageReference ref =
          FirebaseStorage.instance.ref().child("avatars").child(imageFile);
      StorageUploadTask uploadTask = ref.putFile(image);

      String _imageUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();
      setState(() {
        imageUrl = _imageUrl;
      });
    } catch (e) {
      print(e);
    }
  }

  void dialogAdd(_context, type) {
    showDialog(
        context: _context,
        builder: (context) {
          return AddDataProfile(type, setData);
        });
  }
}
