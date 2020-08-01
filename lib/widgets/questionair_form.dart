import 'dart:developer' as dev;
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/questionair/questionair_bloc.dart';
import 'package:flutter_app/models/questionair.dart';

class QuestionairForm extends StatefulWidget {
  // This widget is the root of your application.
  final QuestionairBloc bloc;

  QuestionairForm({this.bloc});

  @override
  QuestionairFormState createState() {
    return QuestionairFormState();
  }
}

class QuestionairFormState extends State<QuestionairForm> {
  final _formKey = GlobalKey<FormState>();
  Questionair formInput = Questionair(isCorrected: true, isQuestion: true);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    onSaved: (String value) {
                      Questionair newInput = this.formInput.copyWith();
                      newInput.question = value;
                      setState(() {
                        formInput = newInput;
                      });
                    },
                    maxLength: 255,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter question input';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter your question ?'),
                  ),
                  TextFormField(
                    onSaved: (String value) {
                      Questionair newInput = this.formInput.copyWith();
                      newInput.answer = value;
                      setState(() {
                        formInput = newInput;
                      });
                    },
                    maxLength: 255,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter answer input';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter your Answer ?'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.

                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data...')));
                        final questionBloc =
                            BlocProvider.of<QuestionairBloc>(context);
                        _formKey.currentState.save();
                        questionBloc.question.add(this.formInput);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ]))));
  }
}
