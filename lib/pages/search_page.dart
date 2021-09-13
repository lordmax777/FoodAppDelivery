import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/func/indexed.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List list1 = [];
  List list1narx = [];
  List list1rasm = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Pictures").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              backgroundColor: Color(0xFFF2F2F2),
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Color(0xFFEEEEEE),
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 100,
                  // color: Color(0xFFF2F2F2),
                  child: TextFormField(
                    autofocus: true,
                    // controller: _controller,
                    decoration: InputDecoration(border: InputBorder.none),
                    cursorColor: Colors.black,
                    cursorHeight: 30,
                    onChanged: (e) {
                      var lista = [];
                      var listanarx = [];
                      var listarasm = [];
                      for (var i = 0; i < snapshot.data!.docs.length; i++) {
                        lista.add([snapshot.data!.docs[i]["name"],

                            snapshot.data!.docs[i]["name1"]]);
                        listanarx.add(snapshot.data!.docs[i]["number"]);
                        listarasm.add(snapshot.data!.docs[i]["image"]);
                      }
                      var listsearch2 = lista;
                      var listsearch2narx = listanarx;
                      var listsearch2rasm = listarasm;

                      setState(() {
                        if (e.toString().length == 0 && e.isEmpty) {
                          list1 = listsearch2;
                          list1narx = listsearch2narx;
                          list1rasm = listsearch2rasm;
                        } else {
                          List list2 = [];
                          List<String> list2narx = [];
                          List<String> list2rasm = [];
                          for (var i = 0; i < listsearch2.length; i++) {
                            if ((listsearch2[i][0]+listsearch2[i][1]).toString()
                                .toLowerCase()
                                .startsWith(e.toString().toLowerCase())) {
                              list2.add(listsearch2[i]);
                              list2narx.add(listsearch2narx[i]);
                              list2rasm.add(listsearch2rasm[i]);
                            }
                          }
                          list1 = list2;
                          list1narx = list2narx;
                          list1rasm = list2rasm;
                        }
                      });
                    },
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color.fromRGBO(249, 249, 249, 1),
                ),
                child: list1.length != 0
                    ? Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text("Found " + (list1.length).toString() + " results"),
                    ),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape
                                ? 3
                                : 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: list1.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 200,
                                  height: 320.0,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40.0, left: 18.0, right: 10.0),
                                          child: Container(
                                            width: 160.0,
                                            height: 230.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 48.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Image.network(
                                          list1rasm[index],
                                          height: 193.0,
                                          width: 193.0,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 20.0,
                                        left: 52.0,
                                        child: Container(
                                          height: 70,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    list1[index][0],
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  Text(
                                                    list1[index][1],
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),

                                                ],
                                              ),


                                              Text(
                                                list1narx[index],
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Indexed(snapshot.data!.docs[index], index)));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
                    : Center(
                  child: Container(
                    height: 400,
                    child: Column(children: [
                      Container(
                        height: 91,
                        child: Image.asset("assets/images/search.png"),
                      ),
                      SizedBox(height: 53.25),
                      Text(
                        "Item not found",
                        style:
                        TextStyle(color: Colors.black, fontSize: 28),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Try searching the item with\na different keyword.",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Colors.grey, fontSize: 17),
                      )
                    ]),
                  ),
                ),
              ),
            );
          }
        });
  }
}