import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction ;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(10),
      color: Colors.white,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       children: <Widget>[
         TextField(
           decoration: InputDecoration(labelText: 'Title'),
           controller: titleController,
         ),
         TextField( 
           decoration: InputDecoration(labelText: 'Amount'),
           controller: amountController,
           onSubmitted:(val){widget.addNewTransaction(titleController.text,double.parse(amountController.text));} ,
           keyboardType: TextInputType.datetime,
         ),
         Container(width: 130,height: 40,margin:EdgeInsets.only(top: 20) , child: FlatButton(onPressed:(){widget.addNewTransaction(titleController.text,double.parse(amountController.text));Navigator.of(context).pop();}, child:Text('Enter',style: TextStyle(color: Colors.white,fontSize: 16)),color: Color.fromRGBO(71,8,154, 1),))
       ],
     ), 
    );
  }
}