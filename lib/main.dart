import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class InfiniteListViewState extends State<InfiniteListView>{
  var items = new List<String>.generate(20, (i) =>"Item $i");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        child: ListView.builder(
          itemCount: items.length+1,
          itemBuilder: (context, index){
            final widgetItem = (index == items.length)?
                new RaisedButton(
                  child: const Text('Load more....'),
                  color: Colors.greenAccent,
                  splashColor: Colors.red,
                  elevation: 4.0,
                  onPressed: (){
                    var nextItems = new List<String>.generate(20, (i){
                      var itemId = i+items.length;
                      return "Item $itemId";
                    });
                    setState(() {
                      items.addAll(nextItems);
                    });
                  },
                ):
                new ListTile(
                  title: new Text('${items[index]}'),
                );
            return widgetItem;
          },
        ),
      )
    );
  }
}
class InfiniteListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InfiniteListViewState();
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: new InfiniteListView(),
    );

  }
}
