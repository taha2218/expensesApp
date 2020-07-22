import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionsList;

  TransactionList(this._transactionsList);

  @override
  Widget build(BuildContext context) {
    return Column(
                //Expenses Card Starts here !
                children: _transactionsList.map((transaction) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.5, 1],
                      colors: [Color.fromRGBO(100, 16, 210, 1), Color.fromRGBO(153, 8, 196, 1)]),
                      borderRadius:BorderRadius.circular(6),
                      boxShadow: [BoxShadow(
                        color: Color.fromRGBO(100, 2, 255, 0.3),
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 3)
                      )]
                    ),
                    padding: EdgeInsets.all(0),
                    margin:EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:BorderRadius.circular(6)
                          ),
                          //color: Colors.white,
                          //card content
                          child: Text('${transaction.amount.toStringAsFixed(2)}',style:TextStyle(color: Color.fromRGBO(39, 0, 119, 1),fontWeight: FontWeight.bold,fontSize: 30),),
                          padding: EdgeInsets.all(14),),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(transaction.title,style:TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold)),
                            Text(DateFormat.yMMMd().format(transaction.date),style:TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8)),),],),
                        )],
                    ),
                  );
                } ).toList(),
              );
  }
}