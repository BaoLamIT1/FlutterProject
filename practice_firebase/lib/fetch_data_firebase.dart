import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class FetchDataFirebase extends StatefulWidget {
  const FetchDataFirebase({super.key});
  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FetchDataFirebase> {
  final CollectionReference fetchData =
      FirebaseFirestore.instance.collection("FetchData");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Fetch Data from Firebase"),
      ),
      // StreamBuilder: Is one of Widget listened data from FireStore and update UI whenever db change
      body: StreamBuilder(
          stream: fetchData.snapshots(), // stream
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
            if (streamSnapshot.hasData){
              return ListView.builder(
                  itemCount: streamSnapshot.data?.docs.length,
                  itemBuilder: (context,index){ // create each items in list
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];   // represent for one doc in FireStore
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: ListTile(
                          title: Text(
                            documentSnapshot['name'],  // get 'name' field in db
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          subtitle: Text(documentSnapshot['definition']), // get 'definition' field in db
                        ),
                      ),
                    );
                  }
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );

          }),
    );
  }
}
