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

void main(List<String> arguments) {
  List<Process> prs = List<Process>();
  int choose;
  var number = true;
  while (number) {
    print('1. Add process');
    print('2. Remove process');
    print('3. Print fcfs table');
    print('4. Exit');
    print('Enter option: ');
    choose = int.parse(stdin.readLineSync());
    switch (choose) {
      case 1:
        addprocess(prs);
        fcfsalgo(prs);
        break;
      case 2:
        removeprocess(prs);
        fcfsalgo(prs);
        break;
      case 3:
        break;
      case 4:
        number = false;
        break;
      default:
        print('enter a valid number');
        break;
    }
  }
}

void addprocess(List l) {
  print('Pid\tat\tbt');
  for (int i = 0; i < l.length; i++) {
    l[i].printatbt();
  }
  print('');
  stdout.write('at => ');
  // ignore: omit_local_variable_types
  int at = int.parse(stdin.readLineSync());
  stdout.write('bt => ');
  // ignore: omit_local_variable_types
  int bt = int.parse(stdin.readLineSync());
  l.add(Process(at, bt));
  assignPid(l);
}

void removeprocess(List l) {
  print('Pid\tat\tbt');
  for (int i = 0; i < l.length; i++) {
    l[i].printatbt();
  }
  print('');
  stdout.write('Enter the Pid you want to remove - ');
  // ignore: omit_local_variable_types
  int id = int.parse(stdin.readLineSync());
  if (id < l.length) {
    l.removeAt(id);
    assignPid(l);
  } else {
    print('enter a valid Pid');
  }
}

void fcfsalgo(List<Process> lgantt) {
  //var lgantt = List.of(l);
  lgantt.sort((a, b) => a.at.compareTo(b.at));
  int i = 0;
  int time = lgantt[0].at;
  for (i = 0; i < lgantt.length; i++) {
    if (time >= lgantt[i].at) {
      lgantt[i].start_time = time;
      lgantt[i].ct = lgantt[i].bt + lgantt[i].start_time;
      time = lgantt[i].ct;
      lgantt[i].tat = lgantt[i].ct - lgantt[i].at;
      lgantt[i].wt = lgantt[i].start_time - lgantt[i].at;
    } else {
      lgantt[i].start_time = lgantt[i].at;
      lgantt[i].ct = lgantt[i].bt + lgantt[i].start_time;
      time = lgantt[i].ct;
      lgantt[i].tat = lgantt[i].ct - lgantt[i].at;
      lgantt[i].wt = lgantt[i].start_time - lgantt[i].at;
    }
  }
  lgantt.sort((a, b) => a.pid.compareTo(b.pid));
}

void assignPid(List l) {
  for (int i = 0; i < l.length; i++) {
    l[i].pid = 'P$i';
  }
}
