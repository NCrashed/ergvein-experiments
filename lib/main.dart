import 'package:flutter/material.dart';
import 'list.dart';

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
        primarySwatch: Colors.blueGrey,
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
            balanceHeader(theme),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: <Widget>[
                  historyRow(theme, "Grocery", "1 min ago", -221),
                  historyRow(theme, "Burger payment", "3 hours ago", 1000),
                  historyRow(theme, "Bar for company", "4 hours ago", -19326),
                  historyRow(theme, "Salary August", "1 month ago", 364000),
                  historyRow(theme, "Debt Sergey", "1 month ago", 130000),
                  historyRow(theme, "Donation", "2 month ago", -7500),
                  historyRow(theme, "VPN anual", "3 month ago", -54531),
                  historyRow(theme, "Unknown", "3 month ago", 124),
                  historyRow(theme, "Salary June", "4 month ago", 345000),
                  historyRow(theme, "Gift family", "4 month ago", -23456),
                  historyRow(theme, "Donation", "4 month ago", -45),
                  historyRow(theme, "Fastfood", "5 month ago", -1000),
                ],
              ),
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

  Container historyRow(
      ThemeData theme, String description, String time, int amount) {
    var amountWidget = null;
    if (amount >= 0) {
      amountWidget = Text("+$amount sat",
          style: theme.textTheme.subtitle1?.copyWith(color: theme.accentColor));
    } else {
      amountWidget = Text("$amount sat",
          style: theme.textTheme.subtitle1?.copyWith(color: theme.errorColor));
    }
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            size: 35,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: theme.textTheme.headline5,
                ),
                Text(
                  time,
                  style: theme.textTheme.subtitle2
                      ?.copyWith(color: theme.accentColor),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [amountWidget],
          ))
        ],
      ),
    );
  }

  Container balanceHeader(ThemeData theme) {
    return Container(
      color: theme.colorScheme.background.withAlpha(100),
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "23 928 056",
                      style: theme.textTheme.headline4
                          ?.copyWith(color: theme.colorScheme.onSurface),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        " sat",
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subBalance(theme, "7 215 100 sat",
                  icon: Icon(
                    Icons.bolt,
                    color: theme.colorScheme.secondaryVariant,
                  )),
              subBalance(theme, "2 452 201 sat",
                  icon: Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.waves,
                      color: theme.colorScheme.secondaryVariant,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Container subBalance(ThemeData theme, String balance, {Widget? icon}) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Row(
        children: nullAppend(icon) +
            [
              Text(balance,
                  style: theme.textTheme.headline6
                      ?.copyWith(color: theme.colorScheme.secondaryVariant))
            ],
      ),
    );
  }
}
