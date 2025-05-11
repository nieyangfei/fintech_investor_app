import 'package:fintech_investor_app/models/open_account.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountsState();
}

class AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Account",
            style: Theme.of(context).textTheme.headlineLarge,
            // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.savings, color: Color(0xFFE5A4A7)),
              title: Text("Savings"),
              subtitle: Text("Balance: \$12345.00"),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.currency_bitcoin, color: Colors.yellow),
              title: Text("Bitcoin"),
              subtitle: Text("Hold: 1.35 bitcoins, value: \$9564.56"),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.show_chart, color: Colors.green),
              title: Text("Stock Market"),
              subtitle: Text("Value: \$954564.56"),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          OpenAccount(),
        ],
      ),
    );
  }
}
