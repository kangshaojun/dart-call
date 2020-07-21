import 'package:flutter/material.dart';
import './call/call.dart';
import './call/notify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call示例',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Call示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {

    var data = {
      'userId':111,
      'userName':'玄微子'
    };

    Call.dispatch(Notify.TEST_NOTIFY,data:data);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TestWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '点击派发消息',
        child: Icon(Icons.add),
      ),
    );
  }
}


class TestWidget extends StatefulWidget{

  TestWidget();

  @override
  TestWidgetState createState() => TestWidgetState();

}

class TestWidgetState extends State<TestWidget>{

  String userName = '';

  @override
  void initState() {
    super.initState();

    Call.addCallBack(Notify.TEST_NOTIFY,this._callBack);

  }

  _callBack(data) {
    this.setState(() {
      userName = data['userName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("监听到的数据为:" + userName),
    );
  }

}
