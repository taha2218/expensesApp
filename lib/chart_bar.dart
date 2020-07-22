import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPct;

  ChartBar(this.label,this.spendingAmount,this.spendingPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${spendingAmount.toStringAsFixed(0)}',style: TextStyle(color: Colors.white,),),
        Container(
          height: 70,
          width: 10,
          margin: EdgeInsets.only(top:10,bottom:10),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border:Border.all(color:Colors.white,width: 1.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),),
              FractionallySizedBox(
                heightFactor: spendingPct,
                child: Container(decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.5, 1],
                      colors: [Color.fromRGBO(100, 16, 210, 1), Color.fromRGBO(153, 8, 196, 1)]),
                  borderRadius: BorderRadius.circular(3)),),
              ),
            ],
          ),
        ),
        Text(label,style: TextStyle(color: Colors.pink),),
      ],
    );
  }
}