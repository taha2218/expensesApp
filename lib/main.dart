import 'package:Expenses/chart.dart';
import 'package:Expenses/new_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(71,8,154, 1),
      ),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(_){
      return NewTransaction(_addNewTransaction);
    },enableDrag: true  );
  }

  final List<Transaction> _transactionsList = [
    Transaction(amount:18.18,date:DateTime.now() ,id:'1',title:'PAYMENT 1' ),
  ];
  void _addNewTransaction(String title, double amount){
    final newTx = Transaction(amount: amount,title: title,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      _transactionsList.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactionsList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
          ),
        );  
     }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker',
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        actions: <Widget>[
          IconButton(padding: EdgeInsets.only(right: 5), color: Colors.white, icon: Icon(Icons.add), onPressed: () => startAddNewTransaction(context) )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(0 , 0, 0, 0.942),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
              Chart(_recentTransactions),
              Container(
                margin: EdgeInsets.symmetric(horizontal:11,vertical: 0),
                child: TransactionList(_recentTransactions),
              ) 
            ], 
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton( backgroundColor: Colors.white, child: Icon(Icons.add),foregroundColor: Colors.purple,onPressed: ()=>startAddNewTransaction(context),),
    );
  }
}
