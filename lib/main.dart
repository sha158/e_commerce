import 'package:e_commerce/Utils/products_json.dart';
import 'package:e_commerce/secon_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
        
        
        ,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),centerTitle: true,),
      body: Container(
        child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return (result[index]["p_category"] == null)
                ? Container()
                : GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Seconscreen(
                          string: result[index]["p_category"].toString(),
                        ),
                      ),
                    ),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.green),
                      child: ListTile(
                        title: Center(child: Text(result[index]["p_category"].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),)),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
