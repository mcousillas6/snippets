import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterBloc {

  final _incrementCounterController = StreamController<IncrementCounter>();
  final count = BehaviorSubject<int>();

  CounterBloc() {
    count.add(0);
    _incrementCounterController.stream.listen(_handleIncrementCounter);
  }

  Sink<IncrementCounter> get incrementCounter => _incrementCounterController.sink;

  void _handleIncrementCounter(IncrementCounter action) {
    count.add(count.value + 1);
  }


  void dispose() {
    _incrementCounterController.close();
  }
}

// Neded to watermark the handler, couldn't get it to work with void type.
class IncrementCounter {}
