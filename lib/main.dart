import 'package:flutter/material.dart';
import 'package:snippets/app_provider.dart';
import 'package:snippets/bloc/counter_bloc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = AppProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
    return app;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    AppProvider.userBlocOf(context).incrementCounter.add(IncrementCounter());
  }

  Text _buildCounter(BuildContext context, AsyncSnapshot<int> snapshot) {
    final counter = snapshot.data;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.display1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonCounter = StreamBuilder<int>(
      stream: AppProvider.userBlocOf(context).count,
      builder: (context, snapshot) => _buildCounter(context, snapshot),
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            buttonCounter,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
