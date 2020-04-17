import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var status;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

        home: Scaffold(
            appBar: AppBar(
              title: Text("First"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Let's get you Hooked Up!",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text("Benefits includes: "),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(
                                Icons.map,
                              ),
                              contentPadding: EdgeInsets.all(1),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "All locations",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Connect through any of our 97 locations",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                          ListTile(
                              leading: Icon(
                                Icons.map,
                              ),
                              contentPadding: EdgeInsets.all(1),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "All locations",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Connect through any of our 97 locations",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                          ListTile(
                              leading: Icon(
                                Icons.map,
                              ),
                              contentPadding: EdgeInsets.all(1),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "All locations",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Connect through any of our 97 locations",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          "Choose your plan",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: postrequest,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                            color: Colors.pinkAccent),
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.green,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "6 Months Member Ship",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Valid for a 6 months from the date of Purschase",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          trailing: Text(
                            "\$29",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: postrequest,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                            color: Colors.white),
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "12 Months MemberShip",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Valid for a 6 months from the date of Purschase",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context){
                                       return   FlatButton(
                        onPressed: ()=>showDialog(context: context, barrierDismissible: true, builder: (_)=>AlertDialog(
                            title: Text("Status"),
                            content: Text(status==null?"Not Activated":status.toString()),
                            
                          )),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Text(
                            "Activate @ \$29",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      }
                    ),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "FAQ",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        )),
                        

                  ],
                ),
              ),
              
            )));
  }

void postrequest() async {
    http.Response restotal = await http.post(
        'https://backend-test-zypher.herokuapp.com/ebooks/activatePlan',
        body: {"planId" : "6 months" }
        );
    if (restotal.statusCode == 200) {
      String data = restotal.body;

      String stat = jsonDecode(data)['status']; //confirmed
      print(stat);
      setState(() {
        this.status=stat;
      });
    } else {
      print(restotal.statusCode);
    }
  }
}


