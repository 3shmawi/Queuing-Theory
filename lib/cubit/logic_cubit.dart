import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  String? resultNumOfClients;
  String? resultTimeClintWillTake;
  String? calcTime;
  String? calcNumber;

  void calcNumOfClientsAtSystem({
    required String capacity,
    required String arrivalTime,
    required String serviceTime,
    required String time,
  }) {
    calcTime = time;
    double dTime = double.parse(time);
    double dArrivalTime = double.parse(arrivalTime);
    double dServiceTime = double.parse(serviceTime);
    int iCapacity = int.parse(capacity) + 1;

    double ti = 0.0;
    double arrivalRate = 1 / dArrivalTime;
    double serviceRate = 1 / dServiceTime;
    double resultRate = serviceRate / arrivalRate;

    ti = (iCapacity - resultRate) / (arrivalRate - serviceRate);
    print('tiiiiiiiiiii  =>    $ti');

    int finalTiResult = ti.round();
// if(ti>temp){
//    finalTiResult = ti.round();
// }else{
//    finalTiResult = ti.floor();
// }

    //
    //
    //  print(iCapacity);

    while (iCapacity ==
        (((arrivalRate * finalTiResult).round() -
            (serviceRate * finalTiResult - resultRate).round()))) {
      finalTiResult -= dArrivalTime.toInt();
      print('final $finalTiResult');
    }

    print('tiiiiiiiiiii3333  =>    $finalTiResult');
    if (dTime < dArrivalTime) {
      resultNumOfClients = '0';
    } else if (dTime >= dArrivalTime && dTime < finalTiResult) {
      resultNumOfClients = (((arrivalRate * dTime).toInt()) -
              ((serviceRate * dTime - resultRate).toInt()))
          .toString();
    } else if (dTime >= finalTiResult) {
      resultNumOfClients = '$capacity  &  ${int.parse(capacity) - 1}';
    }

    emit(ChangeNumOfClientsAtSystem());
  }

  void calcTimeWitchClientAtSystemWillTake({
    required String capacity,
    required String arrivalTime,
    required String serviceTime,
    required String number,
  }) {
    calcNumber = number;
    double dNumber = double.parse(number);
    double dArrivalTime = double.parse(arrivalTime);
    double dServiceTime = double.parse(serviceTime);
    int iCapacity = int.parse(capacity) + 1;

    double ti = 0.0;
    double arrivalRate = 1 / dArrivalTime;
    double serviceRate = 1 / dServiceTime;
    double resultRate = serviceRate / arrivalRate;

    ti = (iCapacity - resultRate) / (arrivalRate - serviceRate);
    print('tiiiiiiiiiii  =>    $ti');

    int finalTiResult = ti.round();
// if(ti>temp){
//    finalTiResult = ti.round();
// }else{
//    finalTiResult = ti.floor();
// }

    //
    //
    //  print(iCapacity);

    while (iCapacity ==
        (((arrivalRate * finalTiResult).round() -
            (serviceRate * finalTiResult - resultRate).round()))) {
      finalTiResult -= dArrivalTime.toInt();
      print('final $finalTiResult');
    }

    print('tiiiiiiiiiii3333  =>    $finalTiResult');
    if (dNumber == 0) {
      resultTimeClintWillTake = '0';
    } else if (dNumber < arrivalRate * finalTiResult) {
      resultTimeClintWillTake =
          ((dServiceTime - dArrivalTime) * (dNumber - 1)).toString();
    } else {
      resultTimeClintWillTake =
          '${(dServiceTime - dArrivalTime) * (arrivalRate * finalTiResult - 2)}  &  ${(dServiceTime - dArrivalTime) * (arrivalRate * finalTiResult - 3)}';
    }

    emit(ChangeTimeWitchClientAtSystemWillTake());
  }

  String? n;
  String? w;

  void changeN(String value) {
    n = value;
    if (n!.isEmpty) n = null;
    emit(ChangeNState());
  }

  void changeW(String value) {
    w = value;
    if (w!.isEmpty) w = null;
    emit(ChangeWState());
  }
}
