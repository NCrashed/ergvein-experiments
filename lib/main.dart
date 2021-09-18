import 'package:flutter/material.dart';

void main() {
  runApp(const ErgveinApp());
}

class ErgveinApp extends StatelessWidget {
  const ErgveinApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ergvein',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const BalancePage(title: 'Ergvein balance page'),
    );
  }
}

class BalancePage extends StatefulWidget {
  const BalancePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("main wallet"),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.menu,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: theme.backgroundColor,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "23 928 056 sat",
                        style: theme.primaryTextTheme.headline4,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subBalance(theme),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20.0),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Icon(Icons.waves),
                            ),
                            Text("2 452 201 sat",
                                style: theme.primaryTextTheme.headline6),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Text(
              'You have pushed the button HAHA many times:',
            ),
            Text(
              '$_counter',
              style: theme.textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container subBalance(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Row(
        children: [
          Icon(Icons.bolt),
          Text("7 215 100 sat", style: theme.primaryTextTheme.headline6)
        ],
      ),
    );
  }
}
