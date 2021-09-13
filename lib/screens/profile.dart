import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


FirebaseAuth _authUser = FirebaseAuth.instance;
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String pay = "Card";
  var datas;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    take().then((value) {
      setState(() {
        datas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return datas != null ? Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        toolbarHeight: 72.0,
        elevation: 0,
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(
            splashRadius: 1,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 20.0,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "My profile",
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJfa758-9Zet25uR43OnWUDxPh_5ivrKWg4g&usqp=CAU",
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                datas['email'],
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 30.0,
                                width: 200.0,
                                child: Text(
                                  "Trasaco hotel, behind navrongo campus",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 45.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        RadioListTile(
                          value: "Card",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF47B0A),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Card",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          value: "Mobile",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEB4796),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                    child: Icon(
                                      Icons.account_balance,
                                      color: Colors.white,
                                      size: 20.0,
                                    )),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Mobile Money (MTN,VODA)",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          value: "Delivery",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF0038FF),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.paypal,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Pay on delivery",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65.0, left: 3.0, right: 3.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Update Information"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            )
          ],
        ),
      ),
    ) : Scaffold(body: Center(child: CupertinoActivityIndicator(),));
  }
  Future take()async{
    DocumentSnapshot _documnet = await _firestore.doc("users/${_authUser.currentUser!.uid}").get();
    return _documnet;
  }
}
