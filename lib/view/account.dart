import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/services/authservice.dart';
import 'package:arun_final_project/view/address_change.dart';
import 'package:arun_final_project/view/change_password.dart';
import 'package:arun_final_project/view/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround3,
      appBar: AppBar(
        backgroundColor: AppColor.backGround3,
        title: const Text('Account'),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child:  CircularProgressIndicator());
            } else if (snapshot.hasData) {
              String userEmail = snapshot.data!['email'][0];
              var data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          children: [
                            data['photo'] != ''
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(data['photo']),
                                  )
                                : CircleAvatar(
                                    radius: 30,
                                    child: Text(userEmail.toUpperCase()),
                                  ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(data['username']),
                                Text(data['email'])
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('General'),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColor.backGround3,
                                  child: Icon(
                                    Icons.person_outline,
                                    color: AppColor.backGround2,
                                  ),
                                ),
                                title: const Text(
                                  'Edit Profile ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    const Text('Edit profile photo,Email'),
                                trailing:
                                const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                onTap: (){ Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const EditProfile();
                                  },
                                ));},
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColor.backGround3,
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: AppColor.backGround2,
                                  ),
                                ),
                                title: const Text(
                                  'Change password ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    const Text('Update your account security'),
                                trailing:  const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                onTap: (){ Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const ChangePassword();
                                  },
                                ));},
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const AddressChange();
                                    },
                                  ));
                                },
                                leading: CircleAvatar(
                                  backgroundColor: AppColor.backGround3,
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.backGround2,
                                  ),
                                ),
                                title: const Text(
                                  'Address Change ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    const Text('Change your delivery address'),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Preferences'),
                                ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: AppColor.backGround3,
                                      child: Icon(
                                        Icons.person_outline,
                                        color: AppColor.backGround2,
                                      ),
                                    ),
                                    title: const Text(
                                      'Notifications',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: const Text(
                                        'Customize your notification'),
                                    trailing: Switch(
                                      activeColor: AppColor.backGround2,
                                      hoverColor: AppColor.backGround3,
                                      value: false,
                                      onChanged: (value) {},
                                    )),
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: AppColor.backGround3,
                                    child: Icon(
                                      Icons.help_outline,
                                      color: AppColor.backGround2,
                                    ),
                                  ),
                                  title: const Text(
                                    'FAQ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    AuthService().logoutUser(context);
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: AppColor.backGround3,
                                    child: Icon(
                                      Icons.logout_outlined,
                                      color: AppColor.backGround2,
                                    ),
                                  ),
                                  title: const Text(
                                    'Log Out',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          }),
    );
  }
}
