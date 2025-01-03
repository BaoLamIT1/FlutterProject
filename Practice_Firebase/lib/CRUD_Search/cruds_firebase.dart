import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRUDSearch extends StatefulWidget {
  const CRUDSearch({super.key });

  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<CRUDSearch>{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _definitionController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference myData =
      FirebaseFirestore.instance.collection("FetchData");

  Future<void> addNewData() async{
    return showDialog(context: context,
        builder: (BuildContext context){
      return myDiaLogBox(
        context: context,
        name: "Input new data",
        condition: "Create",
        onPressed: (){
          String name = _nameController.text;
          String definition = _definitionController.text;
            myData.add({
              'name': name,
              'definition': definition,
            });
          Navigator.pop(context);
        },
      );
      },
    );
  }
  // for U-update data
  Future<void> _update(DocumentSnapshot documentSnapshot) async{
    _nameController.text = documentSnapshot['name'];
    _definitionController.text = documentSnapshot['definition'];
    return showDialog(context: context,
        builder: (BuildContext context){
      return myDiaLogBox (
        context: context,
        name: "Update data",
        condition: "Update",
        onPressed: () async{
          String name = _nameController.text;
          String definition = _definitionController.text;
          // await Future.delayed(Duration(seconds: 3)); // wait for 3s for call API then update
          await myData.doc(documentSnapshot.id).update({
            'name': name,
            'definition': definition,
          });
          _nameController.text ='';
          _definitionController.text ='';

          Navigator.pop(context);
        },
      );
    });
  }
  // for delete items
  Future<void> delete(String productId) async {
    await myData.doc(productId).delete();
    // for snackbar after delete items
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
        content: Text("Delete Successfully"),
      ),
    );
  }
  // for search operation
  bool isSearchClick = false;
  String searchText = '';

  void _onSearchChange(String value) {
    setState(() {
      searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: isSearchClick ? Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            onChanged: _onSearchChange,
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              hintText: "Search...",
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ):
        const Text("FireStore CRUD and Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isSearchClick = ! isSearchClick ;
            });
          }, icon: Icon(Icons.search), color: Colors.white,)
        ],
      ),
      // fetch Data from FireStore (Read) and display item
      body: StreamBuilder(
          stream: myData.snapshots(), // stream
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
            if (streamSnapshot.hasData){
              final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                  .where(
                    (doc) => doc['name'].toLowerCase().contains(
                  searchText.toLowerCase(), // filter search data
                ),
              )
                  .toList();
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context,index){ // create each items in list
                    // represent for one doc in FireStore
                    final DocumentSnapshot documentSnapshot =
                   items[index]; // index after filter search
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: ListTile(
                          title: Text(
                            documentSnapshot['name'],  // get 'name' field in db
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          subtitle: Text(documentSnapshot['definition']), // get 'definition' field in db
                          trailing: SizedBox(width: 100,
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){
                                    _update(documentSnapshot);
                                  }, icon: Icon(Icons.edit), color: Colors.blueAccent,),
                                  IconButton(onPressed: (){
                                    delete(documentSnapshot.id);
                                  }, icon: Icon(Icons.delete), color: Colors.red,),
                                ],
                              ),
                              ),
                        ),
                      ),
                    );
                  }
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          ),
      // For Create new prj icon
      floatingActionButton: FloatingActionButton(
        onPressed: addNewData,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  Dialog myDiaLogBox(
  {
    required BuildContext context,
    required String name,
    required String condition,
    required VoidCallback onPressed,
  }) =>
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close)),
                ],
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Insert name",
                  hintText: 'eg. Java',
                ),
              ),
              TextField(
                controller: _definitionController,
                decoration: InputDecoration(
                  labelText: "Insert definition",
                  hintText: 'eg. Language'
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: onPressed,
                  child: Text(condition)),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      );
}

