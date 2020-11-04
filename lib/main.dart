import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;
  // final databaseReference = FirebaseDatabase.instance.reference();
  TextEditingController myControllername = TextEditingController();
  TextEditingController myControllerroll = TextEditingController();
  TextEditingController myControllercell = TextEditingController();

  String gender ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Test"),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: TextFormField(
                    controller: myControllername,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: 'Enter your name'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: TextFormField(
                    controller: myControllerroll,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: 'Enter your Roll'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: TextFormField(
                    controller: myControllercell,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: 'Enter your Mobile Number'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Select Gender"),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            if (isSwitched) {
                              gender = "Male";
                              print("Male");
                            } else {
                              gender = "FeMale";
                              print("Female");
                            }
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  width: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text(
                      'Submit',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () {
                      print(myControllername.text+" "+myControllerroll.text+" "+myControllercell.text+" "+gender);
                      // Firestore.instance.collection("test").add({
                      //   'name': myControllername.text,
                      //   'roll': myControllerroll.text,
                      //   'phone': myControllercell.text,
                      //   'gender': gender
                      // }).catchError((e){
                      //   print(e);
                      // });
                      createRecord(myControllername.text,myControllerroll.text,myControllercell.text,gender);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // void createRecord(String name, String roll, String cell_no, String gender){
  //   databaseReference.child("1").set({
  //     'name': name,
  //     'roll': roll,
  //     'cell_no': cell_no,
  //     'gender': gender
  //   });
  //
  // }
void createRecord(String name, String roll, String cell_no, String gender) async {
  await  Firestore.instance.collection("test").add({
    'name': name,
    'roll': roll,
    'phone': cell_no,
    'gender': gender
  }).catchError((e){
    print(e);
  });
  }
//
//   DocumentReference ref = await databaseReference.collection("books")
//       .add({
//     'title': 'Flutter in Action',
//     'description': 'Complete Programming Guide to learn Flutter'
//   });
//   print(ref.documentID);
// }
}
