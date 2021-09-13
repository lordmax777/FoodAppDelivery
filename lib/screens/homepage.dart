import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/func/indexed.dart';
import 'package:examinfirebase/orders/order.dart';
import 'package:examinfirebase/pages/search_page.dart';
import 'package:examinfirebase/screens/profile.dart';
import 'package:examinfirebase/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'favourite.dart';
import 'history.dart';

class HomePage2 extends StatefulWidget {
  ZoomDrawerController? _zoomDrawerController;
  HomePage2(this._zoomDrawerController);
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  TextEditingController _search = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;

  Stream<QuerySnapshot> snapData = FirebaseFirestore.instance.collection("Pictures").snapshots();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        toolbarHeight: 65.0,
        elevation: 0,
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(
            splashRadius: 1,
            onPressed: () {
              widget._zoomDrawerController!.open!();
            },
            icon: ImageIcon(
              AssetImage(
                "assets/images/menu.png",
              ),
              color: Colors.black, size: 20,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                splashRadius: 1,
                onPressed: () async {
                  await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Order()));
                },
                icon: ImageIcon(
                  AssetImage("assets/images/shopping-cart.png"),
                  color: Colors.grey.shade800,
                  size: 20.0,
                ),),),
        ],
      ),
      body: snapData != null ? DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  toolbarHeight: getProportionScreenHeight(230.0),
                  backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 18.0),
                        child: Text(
                          "Delicious\nfood for you",
                          style: TextStyle(
                              fontSize: getProportionScreenHeight(34.0),
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(28.0),
                      ),
                      Hero(
                        tag: 'sal',
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              readOnly: true,
                              showCursor: true,
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 17.0),
                                hintText: "Search",
                                prefixIcon: Icon(
                                  CupertinoIcons.search,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              controller: _search,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(50.0),
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(150.0, 45.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: getProportionScreenWidth(40.0)),
                        child: TabBar(
                          physics: BouncingScrollPhysics(),
                          dragStartBehavior: DragStartBehavior.start,
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(
                              left: getProportionScreenWidth(28.0),
                              right: getProportionScreenWidth(28.0)),
                          labelColor: Color.fromRGBO(250, 74, 12, 1),
                          unselectedLabelColor:
                              Color.fromRGBO(154, 154, 157, 1),
                          indicatorColor: Color.fromRGBO(250, 74, 12, 1),
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(text: 'Foods'),
                            Tab(text: 'Drinks'),
                            Tab(text: 'Snacks'),
                            Tab(text: 'Sauce'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: StreamBuilder(
              stream: snapData,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return TabBarView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "see more",
                                  style: TextStyle(
                                      color: Color.fromRGBO(250, 74, 12, 1)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width,
                            height: getProportionScreenHeight(333.0),
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: getProportionScreenWidth(205.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: getProportionScreenHeight(60.0),
                                            left: getProportionScreenWidth(20.0),
                                            child: Container(
                                              width: getProportionScreenWidth(175.0),
                                              height: getProportionScreenHeight(245.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 100.0,
                                            left: 10.0,
                                            right: 0.0,
                                            child: Image.network(
                                              snapshot.data!.docs[index]['image'],
                                              height: getProportionScreenHeight(204.16),
                                              width: getProportionScreenWidth(204.16),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: getProportionScreenHeight(60.0),
                                            left: getProportionScreenWidth(57.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[index]['name'],
                                                  style:
                                                      TextStyle(fontSize: getProportionScreenWidth(22.0), fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  snapshot.data!.docs[index]['name1'],
                                                  style:
                                                      TextStyle(fontSize: getProportionScreenWidth(22.0), fontWeight: FontWeight.w400),
                                                ),
                                                SizedBox(height: getProportionScreenHeight(25.0)),
                                                Text(
                                                    snapshot.data!.docs[index]['narx'],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(250, 74, 12, 1),
                                                      fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Indexed(snapshot.data!.docs[index], index)));
                                    },
                                  );
                                }),
                          ),
                        ],
                      ),
                      drinks(),
                      snikers(),
                      sauce(),
                    ],
                  );
                }
              },
            )),
      ): Center(child: CupertinoActivityIndicator(),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          right: 15.0,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home_sharp),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.favorite_border),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person_outline_sharp),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.history),
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Color.fromRGBO(242, 242, 242, 1),
          unselectedIconTheme: IconThemeData(color: Colors.black26),
          selectedIconTheme:
              IconThemeData(color: Color.fromRGBO(250, 74, 12, 1)),
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavouritePage()));
            } else if (value == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            } else if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
            }
          },
        ),
      ),
    );
  }
  Widget drinks() {
    return Text("b");
  }

  Widget snikers() {
    return Text("c");
  }

  Widget sauce() {
    return Text("d");
  }

}

