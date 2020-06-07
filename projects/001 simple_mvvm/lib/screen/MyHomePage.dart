import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:simple_mvvm/style/AppColor.dart';
import 'package:simple_mvvm/style/AppText.dart';
import 'package:simple_mvvm/style/AppTextStyle.dart';
import 'package:simple_mvvm/viewmodel/MyHomePageViewModel.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return ViewModelProvider<MyHomePageViewModel>.withConsumer(
     viewModelBuilder: () => MyHomePageViewModel(),
      builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppText.push,
            ),
            Text(
              '${model.getCounter}',
              style: AppTextStyle.header1(context, AppColor.primary),
            ),
          ],
        ),
      ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton.extended(onPressed: (){
      model.incrementCounter(); //Increament
    }, label: Icon(Icons.add), elevation: 10, ),

FloatingActionButton.extended(onPressed: (){
      model.decrementCounter(); //Decrement
    }, label: Center(child: Icon(Icons.minimize)), elevation: 10, ),
    ],)
    ),
    );
  }
}
