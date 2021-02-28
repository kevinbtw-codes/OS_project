import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'fcfs.dart';
import 'table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Algorithm(),
    );
  }
}

class Algorithm extends StatefulWidget {
  @override
  _AlgorithmState createState() => _AlgorithmState();
}

class _AlgorithmState extends State<Algorithm> {
  List<Process> prs = [];
  add(TextEditingController control1, TextEditingController control2) {
    setState(() {
      prs.sort((a, b) => a.pid.compareTo(b.pid));
      prs.add(Process(int.parse(control1.text), int.parse(control2.text)));
      control1.clear();
      control2.clear();
      assignPid(prs);
      fcfsalgo(prs);
      prs.sort((a, b) => a.at.compareTo(b.at));
    });
  }

  delete() {
    setState(() {
      prs.sort((a, b) => a.pid.compareTo(b.pid));
      prs.removeLast();
      assignPid(prs);
      fcfsalgo(prs);
      prs.sort((a, b) => a.at.compareTo(b.at));
    });
  }

  TextEditingController control1 = new TextEditingController();
  TextEditingController control2 = new TextEditingController();

  createaddDialog(BuildContext context, List<Process> prs) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ), //this right here
            child: Container(
              height: 280.0,
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'at:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextField(
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  controller: control1,
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'bt:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextField(
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  controller: control2,
                                  keyboardType: TextInputType.number,
                                  onSubmitted: (text) {
                                    add(control1, control2);
                                    Navigator.of(context)
                                        .pop(); // Redraw the Stateful Widget
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 38),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text("Cancel"),
                              onPressed: () {
                                control1.clear();
                                control2.clear();
                                Navigator.of(context).pop();
                              }),
                          RaisedButton(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text("Submit"),
                              onPressed: () {
                                add(control1, control2);
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FCFS Try'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FlatButton(
              onPressed: //null,
                  () {
                prs.sort((a, b) => a.pid.compareTo(b.pid));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TheTable(prs),
                  ),
                );
              },
              child: Icon(
                Icons.table_view_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: GestureDetector(
              onTap: () {
                createaddDialog(context, prs);
              },
              child: Icon(
                Icons.add,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: GestureDetector(
              onTap: () {
                delete();
              },
              child: Icon(
                Icons.delete,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: new ListView.builder(
                itemCount: prs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildProcesscard(context, index)),
          )
        ],
      ),
    );
  }

  Widget buildProcesscard(BuildContext context, int index) {
    var at = prs[index].at.toString();
    var bt = prs[index].bt.toString();
    var tat = prs[index].tat.toString();
    var start = prs[index].start_time.toString();
    var end = prs[index].ct.toString();
    var wt = prs[index].wt.toString();
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Edit',
              color: Colors.black45,
              icon: Icons.edit,
              onTap: () => print('Edit'),
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => print('Delete'),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ExpansionTile(
              title: Text(
                "at: $at\t      \t bt: $bt",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade200,
                child: Text(
                  prs[index].pid,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_drop_down_circle_outlined,
              ),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Start Process: $start",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "End Process: $end",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "TAT: $tat",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "WT: $wt",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
