import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examinfirebase/func/deliverService.dart';
import 'package:examinfirebase/model/deliver.dart';
import 'package:examinfirebase/pages/check_out.dart';
import 'package:examinfirebase/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  SlidableController _slidableController = SlidableController();
  int son = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final orders = Provider.of<List<Deliver>>(context);

    orders.forEach((element) {
      print(element.image);
      print(element.cost);
      print(element.name1);
      print(element.index);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100.0, top: 20.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/iwwa.png",
                height: 20.0,
                width: 20.0,
              ),
              SizedBox(width: 5.0),
              Text(
                "swipe on an item to delete",
                style: TextStyle(fontSize: 10.0),
              )
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Deliver').snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
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
                          padding:
                          const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    item.image.toString(),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10.0, bottom: 10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              item.name1.toString(),
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Text(
                                              item.name2.toString(),
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            item.cost.toString(),
                                            style: TextStyle(
                                                fontSize: 16.0, color: Colors.red),
                                          ),
                                          SizedBox(width: 70.0),
                                          Container(
                                            width: 50.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
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
                                  ),
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
                              child: Icon(Icons.favorite, color: Colors.white),
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
                              child: Icon(Icons.favorite, color: Colors.white),
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
                            await DeliverService()
                                .deleteFirestore(item.index.toString());
                          },
                        ),
                      );
                    },
                  );
                } else{
                  return Text("");
                }
              }else{
                return Center(child: CupertinoActivityIndicator(),);
              }
            }
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: getProportionScreenHeight(35.0)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0)),
                primary: Color(0xFFFA4A0C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckOutPage()));
            },
            child: Text(
              "Complete order",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionScreenWidth(17.0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
