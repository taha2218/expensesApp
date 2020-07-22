import 'package:Expenses/chart_bar.dart';
import 'package:Expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;
  List<Map<String,Object>> get groupedTransactionValues {
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double amountSum = 00.00;
      double amountPct = 00.00;
      for(var i=0;i<recentTransactions.length;++i){
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year){
              amountSum += recentTransactions[i].amount;
            }
      }
      return {'day':DateFormat.E().format(weekDay).substring(0,1),'amount':amountSum};
    } );
  }
  double get totalSpending {
    return groupedTransactionValues.fold(0.00, (sum, item) => sum + item['amount']);
  }
  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 7,vertical: 12),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child:Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                      ...groupedTransactionValues.map((data){return ChartBar(data['day'], data['amount'],(data['amount']as double)/totalSpending);}).toList()
                    ],),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.08),
    ),);
  }
}