import 'package:e_commerce/Utils/products_json.dart';
import 'package:flutter/material.dart';

class Seconscreen extends StatefulWidget {
  final String string;

  const Seconscreen({Key? key, required this.string}) : super(key: key);

  @override
  _SeconscreenState createState() => _SeconscreenState();
}

class _SeconscreenState extends State<Seconscreen> {
  List<TextEditingController> _quantitycontrollers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                _quantitycontrollers.add(new TextEditingController());
                return Container(
                  child: ((widget.string ==
                          result[index]["p_category"].toString())
                      ? Container(
                          // color: Colors.amber,
                          child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.all(16),
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          result[index]["p_img"].toString(),
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.amber),
                                child: Center(
                                    child: Text(
                                  result[index]["p_name"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ))),
                            Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 70,
                                  // padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(22)),
                                  margin: EdgeInsets.symmetric(horizontal: 100),
                                  child: TextField(
                                    textInputAction: TextInputAction.done,
                                    autofocus: true,
                                    textAlign: TextAlign.center,
                                    controller: _quantitycontrollers[index],
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Qty",
                                        focusColor: Colors.white),
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    width: 100,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          result[index]["p_quantity"] =
                                              _quantitycontrollers[index].text;
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title: Text(result[index]
                                                            ["p_quantity"]
                                                        .toString()),
                                                  ));
                                          print(result);
                                        },
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )))
                              ],
                            ),
                          ],
                        ))
                      : Container()),
                );
              }),
        ));
  }
}
