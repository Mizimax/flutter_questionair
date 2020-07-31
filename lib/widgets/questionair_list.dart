import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/questionair/questionair_bloc.dart';
import 'package:flutter_app/models/questionair.dart';

class QuestionairList extends StatelessWidget {
  // This widget is the root of your application.

  final QuestionairBloc bloc;
  final List<Questionair> questions = [];

  QuestionairList({this.bloc});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder<Questionair>(
      stream: this.bloc.questionObs,
      builder: (context, snapshot) {
        var myData = snapshot.data;
        if (myData != null) this.questions.add(myData);
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                    child: Text(questions.length != 0
                        ? questions[index].question
                        : "")),
              );
            });
      },
    ));
  }
}
