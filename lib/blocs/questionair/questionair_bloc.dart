

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter_app/models/questionair.dart';
import 'package:rxdart/rxdart.dart';

class QuestionairBloc implements Bloc {
 
  // Login controller for putting in user credentials
  final _questionData = PublishSubject<Questionair>();
  Sink<Questionair> get question => _questionData.sink;
  Observable<Questionair> get questionObs => _questionData.stream;

  @override
  void dispose() async {
    await _questionData.close();
  }

}