import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/component/component.dart';
import 'package:queue/cubit/logic_cubit.dart';
import 'package:queue/cubit/logic_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController arrivalTimeController = TextEditingController();
  final TextEditingController serviceTimeController = TextEditingController();
  final TextEditingController capacityTimeController = TextEditingController();

  final TextEditingController timeWaitingController = TextEditingController();
  final TextEditingController numberOfClientsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [

                  const DefaultHeadLine(
                    text: 'D/D/1/K-1',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextForm(
                    onChange: (v) {},
                    validator: (value) {
                      for (int i = 0; i < value!.length; i++) {
                        if (value[i] != '0' &&
                            value[i] != '1' &&
                            value[i] != '2' &&
                            value[i] != '3' &&
                            value[i] != '4' &&
                            value[i] != '5' &&
                            value[i] != '6' &&
                            value[i] != '7' &&
                            value[i] != '8' &&
                            value[i] != '9') {
                          return 'it must be integer';
                        }
                      }
                      if (value.isEmpty) return 'it required';
                      return null;
                    },
                    textEditingController: capacityTimeController,
                    suffix: Text(
                      'K-1',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    label: 'Capacity',
                  ),
                  DefaultTextForm(
                    onChange: (v) {},
                    validator: (value) {
                      for (int i = 0; i < value!.length; i++) {
                        if (value[i] != '0' &&
                            value[i] != '1' &&
                            value[i] != '2' &&
                            value[i] != '3' &&
                            value[i] != '4' &&
                            value[i] != '5' &&
                            value[i] != '6' &&
                            value[i] != '7' &&
                            value[i] != '8' &&
                            value[i] != '9' &&
                            value[i] != '.') return 'it must be valid';
                      }
                      if (value.isEmpty) return 'it required';
                      return null;
                    },
                    textEditingController: arrivalTimeController,
                    suffix: Text(
                      '1/λ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    label: 'Arrival time ',
                  ),
                  DefaultTextForm(
                    onChange: (v) {},
                    validator: (value) {
                      for (int i = 0; i < value!.length; i++) {
                        if (value[i] != '0' &&
                            value[i] != '1' &&
                            value[i] != '2' &&
                            value[i] != '3' &&
                            value[i] != '4' &&
                            value[i] != '5' &&
                            value[i] != '6' &&
                            value[i] != '7' &&
                            value[i] != '8' &&
                            value[i] != '9' &&
                            value[i] != '.') return 'it must be valid';
                      }
                      if (value.isEmpty) return 'it required';
                      return null;
                    },
                    textEditingController: serviceTimeController,
                    suffix: Text(
                      '1/µ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    label: 'Service time ',
                  ),
                  const DefaultHeadLine(
                    text: 'Calculate  n(t) = ?',
                  ),
                  BlocBuilder<LogicCubit, LogicState>(
                    builder: (context, state) {
                      var cubit = context.read<LogicCubit>();
                      return DefaultTextForm(
                        onChange: (v) {
                          cubit.changeN(v);
                        },
                        validator: (value) {
                          for (int i = 0; i < value!.length; i++) {
                            if (value[i] != '0' &&
                                value[i] != '1' &&
                                value[i] != '2' &&
                                value[i] != '3' &&
                                value[i] != '4' &&
                                value[i] != '5' &&
                                value[i] != '6' &&
                                value[i] != '7' &&
                                value[i] != '8' &&
                                value[i] != '9' &&
                                value[i] != '.') return 'it must be valid';
                          }
                          if (value.isEmpty) return 'it required';
                          return null;
                        },
                        textEditingController: numberOfClientsController,
                        suffix: Text(
                          't  ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        label:
                            'Number of clients in the system at specific time',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<LogicCubit, LogicState>(
                    builder: (context, state) {
                      var cubit = context.read<LogicCubit>();
                      return DefaultElevatedButton(
                        title: 'Calculate  n(${cubit.n ?? 't'})',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.calcNumOfClientsAtSystem(
                              capacity: capacityTimeController.text,
                              arrivalTime: arrivalTimeController.text,
                              serviceTime: serviceTimeController.text,
                              time: numberOfClientsController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const DefaultHeadLine(
                    text: 'Calculate  Wq(n) = ?',
                  ),
                  BlocBuilder<LogicCubit, LogicState>(
                    builder: (context, state) {
                      var cubit = context.read<LogicCubit>();
                      return DefaultTextForm(
                        onChange: (v) {
                          cubit.changeW(v);
                        },
                        validator: (value) {

                          for (int i = 0; i < value!.length; i++) {
                            if (value[i] != '0' &&
                                value[i] != '1' &&
                                value[i] != '2' &&
                                value[i] != '3' &&
                                value[i] != '4' &&
                                value[i] != '5' &&
                                value[i] != '6' &&
                                value[i] != '7' &&
                                value[i] != '8' &&
                                value[i] != '9') {
                              return 'it must be integer';
                            }
                          }
                          return null;
                        },
                        textEditingController: timeWaitingController,
                        suffix: Text(
                          'n  ',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        label: 'Time waiting for a client',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<LogicCubit, LogicState>(
                    builder: (context, state) {
                      var cubit = context.read<LogicCubit>();
                      return DefaultElevatedButton(
                        title: 'Calculate  Wq(${cubit.w ?? 'n'})',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.calcTimeWitchClientAtSystemWillTake(
                              capacity: capacityTimeController.text,
                              arrivalTime: arrivalTimeController.text,
                              serviceTime: serviceTimeController.text,
                              number: timeWaitingController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  resultCard(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row dashLines() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 1.5,
                    width: 91,
                    color: Colors.black,
                  ),
                  Container(
                    height: 25,
                    width: 1.5,
                    color: Colors.black,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 34.0),
                child: Container(
                  height: 25,
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: 50,
            width: 1.5,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 1.5,
                    color: Colors.black,
                  ),
                  Container(
                    height: 1.5,
                    width: 91,
                    color: Colors.black,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0),
                child: Container(
                  height: 25,
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox resultCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.grey[200],
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<LogicCubit, LogicState>(
            builder: (context, state) {
              var cubit = context.read<LogicCubit>();
              return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (cubit.resultNumOfClients != null)
                          Text(
                            'n(${cubit.calcTime ?? 't'})  = ${cubit.resultNumOfClients}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        if (cubit.resultNumOfClients != null)
                          const SizedBox(
                            height: 20,
                          ),
                        if (cubit.resultTimeClintWillTake != null)
                          Text(
                            'Wq(${cubit.calcNumber ?? 'n'}) = ${cubit.resultTimeClintWillTake}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                      ],
                    )
                 ;
            },
          ),
        ),
      ),
    );
  }
}
