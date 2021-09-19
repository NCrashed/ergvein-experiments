import 'package:flutter/material.dart';
import 'list.dart';
import 'icon/icons.dart';
import 'icon/widget.dart';

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

/// Captures different types of payments like onchain, lightning or liquid.
abstract class PaymentType {
  /// Payment type meant to be used as immutable data
  const PaymentType();

  /// Get icon widget that is displayed for payment history.
  Widget icon();

  /// Small icon that indicates payment type
  Widget? subtitle_icon(ThemeData theme);
}

class OnchainPayment extends PaymentType {
  final int confirmations;

  const OnchainPayment({required this.confirmations}) : super();

  @override
  Widget icon() {
    if (this.confirmations == 0) {
      return Icon(
        ErgveinIcons.unconfirmed,
        size: 35,
      );
    } else if (this.confirmations == 1) {
      return Icon(
        ErgveinIcons.confirm_one,
        size: 35,
      );
    } else if (this.confirmations == 2) {
      return Icon(
        ErgveinIcons.confirm_two,
        size: 35,
      );
    } else if (this.confirmations == 3) {
      return Icon(
        ErgveinIcons.confirm_three,
        size: 35,
      );
    } else {
      return Icon(
        Icons.check,
        size: 35,
      );
    }
  }

  @override
  Widget? subtitle_icon(ThemeData theme) {
    return null;
  }
}

class LightningPayment extends PaymentType {
  const LightningPayment() : super();

  @override
  Widget icon() {
    return Icon(
      Icons.check,
      size: 35,
    );
  }

  @override
  Widget? subtitle_icon(ThemeData theme) {
    return Icon(
      Icons.bolt,
      color: theme.colorScheme.secondaryVariant,
    );
  }
}

class LiquidPayment extends PaymentType {
  final int confirmations;

  const LiquidPayment({required this.confirmations}) : super();

  @override
  Widget icon() {
    if (this.confirmations == 0) {
      return Icon(
        ErgveinIcons.unconfirmed,
        size: 35,
      );
    } else {
      return Icon(
        Icons.check,
        size: 35,
      );
    }
  }

  @override
  Widget? subtitle_icon(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(left: 7, top: 3, bottom: 3),
      child: Icon(
        ErgveinIcons.blockstream,
        color: theme.colorScheme.secondaryVariant,
        size: 20,
      ),
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
                  historyRow(theme, "Grocery", "1 min ago", -221,
                      OnchainPayment(confirmations: 0)),
                  historyRow(theme, "Repair cable", "25 min ago", -4500,
                      OnchainPayment(confirmations: 1)),
                  historyRow(theme, "Burger payment", "3 hours ago", 1000,
                      LightningPayment()),
                  historyRow(theme, "Bar for company", "4 hours ago", -19326,
                      LiquidPayment(confirmations: 10)),
                  historyRow(theme, "Salary August", "1 month ago", 364000,
                      OnchainPayment(confirmations: 100)),
                  historyRow(theme, "Debt Sergey", "1 month ago", 130000,
                      LiquidPayment(confirmations: 100)),
                  historyRow(theme, "Donation", "2 month ago", -7500,
                      LightningPayment()),
                  historyRow(theme, "VPN anual", "3 month ago", -54531,
                      OnchainPayment(confirmations: 100)),
                  historyRow(
                      theme, "Unknown", "3 month ago", 124, LightningPayment()),
                  historyRow(theme, "Salary June", "4 month ago", 345000,
                      OnchainPayment(confirmations: 100)),
                  historyRow(theme, "Gift family", "4 month ago", -23456,
                      OnchainPayment(confirmations: 100)),
                  historyRow(theme, "Donation", "4 month ago", -45,
                      LightningPayment()),
                  historyRow(theme, "Fastfood", "5 month ago", -1000,
                      LightningPayment()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.touch_app),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container historyRow(ThemeData theme, String description, String time,
      int amount, PaymentType paymentType) {
    var amountWidget = null;
    if (amount >= 0) {
      amountWidget = Text("+$amount sat",
          style: theme.textTheme.subtitle1?.copyWith(color: theme.accentColor));
    } else {
      amountWidget = Text("$amount sat",
          style: theme.textTheme.subtitle1?.copyWith(color: theme.errorColor));
    }

    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          paymentType.icon(),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: theme.textTheme.headline5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                        Text(
                          time,
                          style: theme.textTheme.subtitle2
                              ?.copyWith(color: theme.accentColor),
                        ),
                      ] +
                      nullAppend(paymentType.subtitle_icon(theme)),
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
                      ErgveinIcons.blockstream,
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
