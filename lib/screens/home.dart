import 'package:flutter/material.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter_app/blocs/questionair/questionair_bloc.dart';
import 'package:flutter_app/widgets/navbar.dart';
import 'package:flutter_app/widgets/questionair_form.dart';
import 'package:flutter_app/widgets/questionair_list.dart';

class MyHomePage extends StatelessWidget {
  // This widget is the root of your application.
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: 'Create your questionair'),
        body: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.16),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: BlocProvider<QuestionairBloc>.builder(
                creator: (context, bag) =>
                    QuestionairBloc(), // Initialise your BLoC here
                builder: (context, bloc) {
                  // Return your widget tree here
                  return Column(children: <Widget>[
                    QuestionairForm(bloc: bloc),
                    Expanded(child: QuestionairList(bloc: bloc))
                  ]);
                })));
  }
}
