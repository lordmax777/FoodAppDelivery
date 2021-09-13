import 'package:examinfirebase/introduction/introduction.dart';
import 'package:examinfirebase/orders/order.dart';
import 'package:examinfirebase/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'oder.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA4A0C),
      body: Padding(
        padding: EdgeInsets.only(left: 45, bottom: 100, top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 40,
                              height: 60,
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.transparent),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 140,
                              height: 60,
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile2()));
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 140,
                              height: 60,
                              child: Text(
                                "orders",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Order()));
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.local_offer,
                              size: 28,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 140,
                              height: 60,
                              child: Text(
                                "offer and promo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Myoffers()));
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.sticky_note_2_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "Privace policy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.security_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "Security",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "sign_out",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    await _authUser.signOut();
                    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Introduction()), (route) => false);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
