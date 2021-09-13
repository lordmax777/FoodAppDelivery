import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../size_config.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;
class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
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
    SizeConfig().init(context);
    return datas != null ? Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        toolbarHeight: 50.0,
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            splashRadius: 1,
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.0,),
          ),
        ),
      ),
      body: Container(
        width:  SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(38.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getProportionScreenWidth(10.0), bottom: getProportionScreenHeight(24.0)),
                child: Text(
                  "My profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionScreenWidth(34.0),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: getProportionScreenWidth(300.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Personal details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "change",
                      style: TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                width: getProportionScreenWidth(325.0),
                height: getProportionScreenHeight(197.0),
                margin: EdgeInsets.only(top: getProportionScreenHeight(24.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 15.0),
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJfa758-9Zet25uR43OnWUDxPh_5ivrKWg4g&usqp=CAU"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: getProportionScreenWidth(16.0),),
                    Container(
                      width: 178.0,
                      margin: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                            EdgeInsets.only(right: 5, top: 5, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Username",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: getProportionScreenWidth(18.0), fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  datas['email'],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: getProportionScreenWidth(13.0), fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 168.0,
                            padding: EdgeInsets.only(
                                right: 5, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "+998 99 806 14 24",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: getProportionScreenWidth(15.0), fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 168.0,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trasaco hotel, behind navrongo campus",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: getProportionScreenWidth(13.0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionScreenHeight(24.0)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      fixedSize: Size(getProportionScreenWidth(315.0), getProportionScreenHeight(60.0))
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Orders",style: TextStyle(color: Colors.black),),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,size: 18.0,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionScreenHeight(24.0),bottom: getProportionScreenHeight(24.0)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      fixedSize: Size(getProportionScreenWidth(315.0), getProportionScreenHeight(60.0))
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pending reviews",style: TextStyle(color: Colors.black),),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,size: 18.0,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getProportionScreenHeight(24.0)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      fixedSize: Size(getProportionScreenWidth(315.0), getProportionScreenHeight(60.0))
                  ),
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Faq",style: TextStyle(color: Colors.black),),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,size: 18.0,),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    fixedSize: Size(getProportionScreenWidth(315.0), getProportionScreenHeight(60.0))
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Help",style: TextStyle(color: Colors.black),),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,size: 18.0,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getProportionScreenHeight(35.0)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0)),
                      primary: Color(0xFFFA4A0C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ) : Scaffold(body: Center(child: CupertinoActivityIndicator(),));
  }
  Future take()async{
    DocumentSnapshot _documnet = await _firestore.doc("users/${_authUser.currentUser!.uid}").get();
    return _documnet;
  }
}
