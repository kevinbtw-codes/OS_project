import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:os_project/algorithms/Priority-new/Main-priority-new.dart';
import 'package:os_project/algorithms/Shortest job First/Main-SJF.dart';
import 'package:os_project/algorithms/FCFS/Main-fcfs.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

//void main() => runApp(WaveDemoApp());

class WaveDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPU Scheduling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaveDemoHomePage(title: 'CPU Scheduling'),
    );
  }
}

class WaveDemoHomePage extends StatefulWidget {
  WaveDemoHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  var flag1 = true,
      flag2 = true,
      flag3 = true,
      flag4 = true,
      flag5 = true,
      flag6 = true;

  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
    double height = 52.0,
    // ignore: non_constant_identifier_names, unused_element
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;

  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22456D),
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10.0,
        backgroundColor: Color(0XFF22456D),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(_blur == null ? Icons.blur_off : Icons.blur_on),
            onPressed: () {
              setState(() {
                _blur = _nextBlur();
              });
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag1 = flag1 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag1
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.deepOrange[50], Color(0xFFFF968A)],
                                [Color(0xFFFFC8A2), Color(0xFFFFAEA5)],
                                /*  [Colors.red[100], Color(0xEBEA9090)],*/
                                [Color(0xFFAEA5), Color(0xFFC5BF)],
                                [Colors.deepOrange[200], Color(0xFFFFDBCC)],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "FCFS",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "First Come First Serve scheduling executes processes in order of their arrival.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.deepOrange[50], Color(0xFFFF968A)],
                                [Color(0xFFFFC8A2), Color(0xFFFFAEA5)],
                                /*  [Colors.red[100], Color(0xEBEA9090)],*/
                                [Color(0xFFAEA5), Color(0xFFC5BF)],
                                [Colors.deepOrange[200], Color(0xFFFFDBCC)],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "FCFS",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Color(0xFFE3796C),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Color(0xFFE3796C),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new MyApp(),
                                      ),
                                    );
                                    //code
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag2 = flag2 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag2
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Color(0xFF8FCACA), Color(0xFFD4F0F0)],
                                [Colors.cyan[100], Color(0xFF55CBCD)],
                                [Colors.cyan[50], Color(0xFFABDEE6)],
                                [Colors.white70, Colors.cyan[400]]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Priority Scheduling",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "Priority Scheduling is a method of scheduling processes that is based on priority.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Color(0xFF8FCACA), Color(0xFFD4F0F0)],
                                [Colors.cyan[100], Color(0xFF55CBCD)],
                                [Colors.cyan[50], Color(0xFFABDEE6)],
                                [Colors.white70, Colors.cyan[400]]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Priority Scheduling",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Colors.cyan[500],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Colors.cyan[500],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new MyPriorityApp(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag3 = flag3 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag3
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.purple[50], Color(0xFFFF968A)],
                                [Colors.purple[300], Colors.purpleAccent],
                                [Colors.purple[100], Colors.purple[400]],
                                [Colors.purple[200], Colors.purple[50]],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Shortest-Job-Next(SJN)",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "Shortest job next, is a scheduling policy that selects the waiting process.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.purple[50], Color(0xFFFF968A)],
                                [Colors.purple[300], Colors.purpleAccent],
                                [Colors.purple[100], Colors.purple[400]],
                                [Colors.purple[200], Colors.purple[50]],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Shortest-Job-Next(SJN)",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Colors.purple[400],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new MySJFApp(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Colors.purple[400],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new MySJFApp(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag4 = flag4 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag4
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.deepOrange[50], Color(0xFFFF968A)],
                                [Color(0xFFFFC8A2), Color(0xFFFFAEA5)],
                                /*  [Colors.red[100], Color(0xEBEA9090)],*/
                                [Color(0xFFAEA5), Color(0xFFC5BF)],
                                [Colors.deepOrange[200], Color(0xFFFFDBCC)],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Round Robin Scheduling",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "Round robin is a CPU scheduling algorithm where each process is assigned a fix time slot in cyclic way.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.deepOrange[50], Color(0xFFFF968A)],
                                [Color(0xFFFFC8A2), Color(0xFFFFAEA5)],
                                /*  [Colors.red[100], Color(0xEBEA9090)],*/
                                [Color(0xFFAEA5), Color(0xFFC5BF)],
                                [Colors.deepOrange[200], Color(0xFFFFDBCC)],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Round Robin Scheduling",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Color(0xFFE3796C),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Color(0xFFE3796C),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag5 = flag5 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag5
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Color(0xFF8FCACA), Color(0xFFD4F0F0)],
                                [Colors.cyan[100], Color(0xFF55CBCD)],
                                [Colors.cyan[50], Color(0xFFABDEE6)],
                                [Colors.white70, Colors.cyan[400]]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Multi Level Queues",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "This is the simplest scheduling algorithm. It simply queues processes in the order that they arrive in the ready queue.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Color(0xFF8FCACA), Color(0xFFD4F0F0)],
                                [Colors.cyan[100], Color(0xFF55CBCD)],
                                [Colors.cyan[50], Color(0xFFABDEE6)],
                                [Colors.white70, Colors.cyan[400]]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Multi Level Queues",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Colors.cyan[500],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Colors.cyan[500],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag6 = flag6 ? false : true;
                });
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: flag6
                    ? Stack(
                        key: ValueKey('stack1-1'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.purple[50], Color(0xFFFF968A)],
                                [Colors.purple[300], Colors.purpleAccent],
                                [Colors.purple[100], Colors.purple[400]],
                                [Colors.purple[200], Colors.purple[50]],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Shortest Remaining Time",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 105, 30, 0),
                            child: AutoSizeText(
                              "The process with the smallest amount of time remaining until completion is selected to execute.",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.brown[700],
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        key: ValueKey('stack1-2'),
                        children: <Widget>[
                          _buildCard(
                            height: 240,
                            backgroundColor: Colors.white,
                            config: CustomConfig(
                              gradients: [
                                [Colors.purple[50], Color(0xFFFF968A)],
                                [Colors.purple[300], Colors.purpleAccent],
                                [Colors.purple[100], Colors.purple[400]],
                                [Colors.purple[200], Colors.purple[50]],
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: _blur,
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: AutoSizeText(
                              "Shortest Remaining Time",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          ButtonBar(
                            buttonMinWidth: 100,
                            buttonHeight: 50,
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 30, 0),
                                child: RaisedButton(
                                  color: Colors.purple[400],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'LEARN',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 120, 50, 0),
                                child: RaisedButton(
                                  color: Colors.purple[400],
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Perform some action
                                  },
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
