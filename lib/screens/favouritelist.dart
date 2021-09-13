import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/func/favariteServis.dart';
import 'package:examinfirebase/model/favarite.dart';
import 'package:examinfirebase/pages/zooom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavariteList extends StatefulWidget {
  const FavariteList({Key? key}) : super(key: key);

  @override
  _FavariteListState createState() => _FavariteListState();
}

class _FavariteListState extends State<FavariteList> {
  SlidableController _slidableController = SlidableController();
  int son = 1;

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Favarite>>(context);

    orders.forEach((element) {
      print(element.image);
      print(element.cost);
      print(element.name1);
      print(element.index);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Favorites')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (orders.length != 0) {
                    return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final item = orders[index];
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          key: Key(item.toString()),
                          controller: _slidableController,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      item.image.toString(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                item.name1.toString(),
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                              Text(
                                                item.name2.toString(),
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              item.cost.toString(),
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(width: 70.0),
                                            Container(
                                              width: 50.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.red),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10.0),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (son >= 1) {
                                                          son -= 1;
                                                        }
                                                      });
                                                    },
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    "$son",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        son += 1;
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.transparent,
                            ),
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child:
                                    Icon(Icons.favorite, color: Colors.white),
                              ),
                              color: Colors.transparent,
                            ),
                          ],
                          secondaryActions: [
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child:
                                    Icon(Icons.favorite, color: Colors.white),
                              ),
                              color: Colors.transparent,
                            ),
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.transparent,
                            ),
                          ],
                          dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                            onDismissed: (action) async {
                              await FavariteService()
                                  .deleteFirestore(item.index.toString());
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100.0,
                          ),
                          Center(
                            child: Container(
                              height: 113,
                              width: 113,
                              child: Image.asset(
                                "assets/images/korzin.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "No orders yet",
                              style: TextStyle(fontSize: 26),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Center(
                              child: Container(
                                width: 233,
                                height: 57,
                                child: Column(
                                  children: [
                                    Text(
                                      "Hit the orange button down ",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey.shade500),
                                    ),
                                    Text(
                                      "below to Create an order",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(314, 70),
                                primary: Color.fromRGBO(250, 74, 12, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Zooom()));
                            },
                            child: Text(
                              "Start ordering",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
