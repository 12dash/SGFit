/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sgfit/view/home_screen.dart';

class DisplayForm extends StatefulWidget {
  State createState() => RegistrationPageState();
}

class RegistrationPageState extends State<DisplayForm> {
  String _value;
  final formKey = GlobalKey<FormState>();
  var _name = new TextEditingController();
  var _age = new TextEditingController();
  // var _gender = new TextEditingController();
  var _height = new TextEditingController();
  var _weight = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        backgroundColor: Colors.cyan[900],
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/reg_page_logo.png'))),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              child: Container(
                                  margin: EdgeInsets.only(top: 170),
                                  child: Center(
                                      child: Text("Welcome",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold))))),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: Container(
                          child: Center(
                              child: Text(
                                  "To get started, we'll need to know some details!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal))))),
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(255, 255, 255, .5),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _name,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _age,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Age",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100])),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: DropdownButton<String>(
                                        items: [
                                          DropdownMenuItem<String>(
                                            child: Text('Male',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                            value: 'Male',
                                          ),
                                          DropdownMenuItem<String>(
                                            child: Text('Female',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                            value: 'Female',
                                          ),
                                          DropdownMenuItem<String>(
                                            child: Text('Others',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                            value: 'Others',
                                          ),
                                        ],
                                        onChanged: (String value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        },
                                        hint: Text('Select Gender',
                                            style: TextStyle(
                                                color: Colors.grey[400])),
                                        value: _value,
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _weight,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Weight (KG)",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _height,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Height (CM)",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0)),
                              onPressed: () {
                                if (_age.text.isEmpty ||
                                    _weight.text.isEmpty ||
                                    _name.text.isEmpty ||
                                    _height.text.isEmpty) {
                                  _showErrorToast("All fields must be filled.");
                                } else if (_name.text.length > 15) {
                                  _showErrorToast(
                                      "Name should be less than 15 characters.");
                                } else if (int.parse(_age.text) < 12 ||
                                    int.parse(_age.text) > 100) {
                                  _showErrorToast("Enter a Valid Age.");
                                } else if (int.parse(_height.text) < 120 ||
                                    int.parse(_height.text) > 240) {
                                  _showErrorToast("Enter a Valid Height.");
                                } else if (int.parse(_weight.text) < 20 ||
                                    int.parse(_weight.text) > 140) {
                                  _showErrorToast("Enter a Valid Weight.");
                                } else {
                                  writeToFileAge(_age.text);
                                  writeToFileHeight(_height.text);
                                  writeToFileWeight(_weight.text);
                                  writeToFileisRegistered("1");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                }
                              },
                              color: Colors.cyan[300],
                              child: Center(child: Text("Register")))
                        ],
                      ))
                ])))));
  }
}

void _showErrorToast(String errormsg) {
  Fluttertoast.showToast(
      msg: errormsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black);
}
