import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_data_table/lazy_data_table.dart';
import 'package:os_project/algorithms/Priority-new/priority-new.dart';

class TheTable extends StatefulWidget {
  List<Process> prs;
  TheTable(this.prs);
  @override
  _TheTableState createState() => _TheTableState(prs);
}

class _TheTableState extends State<TheTable> {
  List<Process> prs;
  _TheTableState(this.prs);
  final List colum_head = ['pid', 'at', 'bt', 'ct', 'tat', 'wt'];
  final int j = 0;
  int thing(i, j) {
    return prs[i].tablevalue(j);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Process Table',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: LazyDataTable(
                  columns: 7,
                  rows: prs.length,
                  tableDimensions: LazyDataTableDimensions(
                    columnHeaderHeight: 50,
                    cellHeight: 50,
                    cellWidth: 68.5,
                  ),
                  columnHeaderBuilder: (i) =>
                      Center(child: Text(colum_head[i].toUpperCase())),
                  dataCellBuilder: (i, j) => Center(
                    child: (j == 0)
                        ? Text(
                            prs[i].pid,
                          )
                        : Text(thing(i, j).toString()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
