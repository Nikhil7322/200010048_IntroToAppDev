import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserInterface()
));

/*class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      )
    );
  }
}*/

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);


  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {

  String output = '0';
  String _output = '0';
  double a = 0.0;
  double b = 0.0;
  String operand = '';

  clicked(String containerText){
    if(containerText=='CLEAR'){
      _output = '0';
      a=0.0;
      b=0.0;
      operand='';
    }
    else if(containerText=='/'||containerText=='x'||containerText=='-'||containerText=='+'){
      a = double.parse(output);
      operand = containerText;
      _output = '0';
    }
    else if(containerText == '.') {
      if (_output.contains('.')) {
        print('repeat');
        return;
      }
      else {
        _output = _output + containerText;

      }

    }
     else if(containerText == '='){
      b = double.parse(output);
      if(operand=='+'){
        _output=(a+b).toString();
      }
      if(operand=='-'){
        _output=(a-b).toString();
      }
      if(operand=='x'){
        _output=(a*b).toString();
      }
      if(operand=='/'){
        _output=(a/b).toString();
      }
      a=0.0;
      b=0.0;
      operand='';

     }
     else{
       _output=_output+containerText;
    }
     print(_output);
     setState(() {
       output= double.parse(_output).toString();
     });

  }


  Widget rowButton(String containerText) {
    return new Expanded(
      child: OutlinedButton(
        //padding: EdgeInsets.all(30.0),
        child: Text(containerText,
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),

        ),
        onPressed: () {
          clicked(containerText);
        },

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 15,
              ),
              child: Text(output,
              style: TextStyle(
                fontSize: 80,
              ),)),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    rowButton('7'),
                    rowButton('8'),
                    rowButton('9'),
                    rowButton('/')

                  ]),
                Row(
                    children: [
                      rowButton('4'),
                      rowButton('5'),
                      rowButton('6'),
                      rowButton('x')

                    ]),
                Row(
                    children: [
                      rowButton('1'),
                      rowButton('2'),
                      rowButton('3'),
                      rowButton('-')

                    ]),
                Row(
                    children: [
                      rowButton('.'),
                      rowButton('0'),
                      rowButton('00'),
                      rowButton('+')

                    ]),
                Row(
                    children: [
                      rowButton('CLEAR'),
                      rowButton('='),

                    ])
              ],
            )
          ],
        )
      ),
    );
  }
}

