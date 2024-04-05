import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/provider/user_update_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController dob = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    number.dispose();
    dob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final update = Provider.of<UserUpdate>(context);
    return Scaffold(
      backgroundColor: AppColor.backGround3,
      appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
          backgroundColor: AppColor.backGround3,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: AppColor.backGround2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  UserUpdate().userUpdate(name, number, dob);
                },
                child: const Text('update'),
              ),
            )
          ]),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              String userEmail = snapshot.data!['email'][0];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            update.addPhoto(
                                                ImageSource.camera, context);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            size: 40,
                                            color: Colors.blue,
                                          )),
                                      const VerticalDivider(),
                                      IconButton(
                                          onPressed: () {
                                            update.addPhoto(
                                                ImageSource.gallery, context);
                                          },
                                          icon: const Icon(
                                            Icons.image,
                                            size: 40,
                                            color: Colors.purple,
                                          )),
                                      const VerticalDivider(),
                                      IconButton(
                                          onPressed: () {
                                            UserUpdate().deletePhoto(context);
                                          },
                                          icon: const Icon(Icons.delete,
                                              size: 40, color: Colors.red)),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: data['photo'] == ''
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200),
                                  child: Text(
                                    userEmail.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(data['photo']),
                                          fit: BoxFit.cover)),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: data['username'],
                            prefixIcon: const Icon(Icons.person_outline)),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: data['email'],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: number,
                        decoration: InputDecoration(
                          hintText: data['phone'],
                          prefixIcon: const Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: dob,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            hintText: data['dob'],
                            prefixIcon: const Icon(Icons.calendar_today_outlined),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  var datePicker = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1960),
                                      lastDate: DateTime.now());
                                  setState(() {
                                    dob.text =
                                        "${datePicker!.day}/${datePicker.month}/${datePicker.year}";
                                  });
                                },
                                icon: const Icon(Icons.calendar_month_outlined))),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
