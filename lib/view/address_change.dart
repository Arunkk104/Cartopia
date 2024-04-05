import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/widget/custom_button.dart';
import 'package:flutter/material.dart';

class AddressChange extends StatelessWidget {
  const AddressChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround3,
      appBar: AppBar(
        title: const Text('Change Deliver Address'),
        centerTitle: true,
        backgroundColor: AppColor.backGround3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Address 1'),
                          const Spacer(),
                          MaterialButton(
                            color: AppColor.backGround2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {},
                            child: const Text('Deliver Here'),
                          ),
                        ],
                      ),
                      const Text('House Name/Number'),
                      const Text('Street'),
                      const Text('City'),
                      const Text('District'),
                      const Text('State'),
                      const Text('Pin code'),
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          backgroundColor: AppColor.backGround2,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'House Name / Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Street',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'City',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'District',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'State',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Pin code',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),const SizedBox(height: 10),
                        CustomButton(text: 'Submit', tap: (){})
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Add Address'),
        ),
      ),
    );
  }
}
