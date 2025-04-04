import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class StoreDataInFirebase extends StatefulWidget {
  const StoreDataInFirebase({super.key});

  @override
  State<StoreDataInFirebase> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StoreDataInFirebase> {
  // for textEditing controller to get data from input field
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController professionController = TextEditingController();

  final CollectionReference myItems =
  FirebaseFirestore.instance.collection("Store Data");// connect to FireStore

  Future<void> storeData() async {
    return showDialog(    //display dialog after click Fob
      context: context,
      builder: (BuildContext context) {
        return myDialogBox(
            context: context,
            onPressed: () {
              String name = nameController.text;
              String address = addressController.text;
              String profession = professionController.text;
              myItems.add({    // add to FireStore
                'name': name,
                'address': address,
                'profession': profession,
              });
              Navigator.pop(context); // terminate the dialog after storing the items
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Store Data on Firebase From User",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: storeData,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  // display dialog for input data
  Dialog myDialogBox({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  const Text(
                    "Store Data From User",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              commonTextField("eg. Hari", "Enter your name", nameController),
              commonTextField(
                  "eg. Mumbai, India", "Enter your address", addressController),
              commonTextField(
                  "eg. Developer", "Enter your position", professionController),
              //
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  "Store",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Padding commonTextField(hint, label, controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}