import 'dart:io';
import 'dart:core';

class Process {
  var pid;
  int at = 0;
  int bt = 0;
  int ct;
  // ignore: non_constant_identifier_names
  int start_time;
  int tat;
  int wt;

  Process(this.at, this.bt);

  @override
  String toString() {
    // ignore: unnecessary_this
    return '${this.pid}\t${this.at}\t${this.bt}\t${this.ct}\t${this.start_time}\t\t${this.tat}\t${this.wt}';
  }

  int tablevalue(int j) {
    switch (j) {
      case 1:
        return this.at;
      case 2:
        return this.bt;
      case 3:
        return this.ct;
      case 4:
        return this.tat;
      case 5:
        return this.wt;
      default:
        return 0;
    }
  }
}

List<Process> sjfalgo(List<Process> l) {
  List<Process> lgantt = [];
  lgantt = List.from(l); //lgantt is the local copy of the processes list
  List<Process> rq = List<Process>();
  List<Process> fq = [];

  lgantt.sort((a, b) => a.at.compareTo(b.at));

  int i = 0;
  int time = lgantt[0].at;

  for (i = 0; i < l.length; i++) {
    if (rq.isEmpty) {
      time = lgantt[0].at;
      time = processexec(lgantt, time, 0);
      fillfq(lgantt, fq, 0);
      fillrq(rq, time, lgantt);
    } else {
      sjfsort(rq);
      time = processexec(rq, time, 0);
      fillfq(rq, fq, 0);
      if (lgantt.isNotEmpty) {
        fillrq(rq, time, lgantt);
      }
    }
  }
  return fq;
}

void sjfsort(List<Process> l) {
  l.sort((a, b) => a.bt.compareTo(b.bt));
  for (var i = 0; i < l.length - 1; i++) {
    if (l[i].bt == l[i + 1].bt) {
      if (l[i].at > l[i + 1].at) {
        Process temp;
        temp = l[i + 1];
        l[i + 1] = l[i];
        l[i] = temp;
      }
    }
  }
}

//will fill the ready queue(rq) and sort it according to their burst time
void fillrq(List<Process> rq, int time, List<Process> l) {
  int i = 0;
  int count = 0;
  l.sort((a, b) => a.at.compareTo(b.at));
  while (l.isNotEmpty && count < l.length) {
    i = 0;
    if (l[i].at <= time) {
      rq.add(l[i]);
      l.removeAt(i);
      count--;
    } else {
      i++;
    }
    count++;
  }

  if (rq.isNotEmpty) {
    sjfsort(rq);
  }
}

//will delete the process from the parent list and add
//it to the finished list fq
void fillfq(List<Process> l, List<Process> fq, int i) {
  fq.add(l[i]);
  l.removeAt(i);
}

int processexec(List<Process> lgantt, int stime, int i) {
  int time;
  lgantt[i].start_time = stime;
  lgantt[i].ct = lgantt[i].bt + lgantt[i].start_time;
  time = lgantt[i].ct;
  lgantt[i].tat = lgantt[i].ct - lgantt[i].at;
  lgantt[i].wt = lgantt[i].tat - lgantt[i].bt;
  return time;
}

void assignPid(List l) {
  for (int i = 0; i < l.length; i++) {
    l[i].pid = 'P$i';
  }
}
