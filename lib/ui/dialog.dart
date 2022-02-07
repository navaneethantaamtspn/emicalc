import 'package:emicalc/cubit/emi_cubit.dart';
import 'package:emicalc/designs/designs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class dialog extends StatefulWidget {
  const dialog({Key? key}) : super(key: key);

  @override
  _dialogState createState() => _dialogState();
}

class _dialogState extends State<dialog> {
  List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";
  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: SingleChildScrollView(
        child: Dialog(
          insetPadding: EdgeInsets.all(70),
          child: Container(
              padding: EdgeInsets.all(10),
              color: Color.fromRGBO(224, 243, 255, 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _principalAmount,
                        decoration: InputDecoration(
                            labelText: "Enter Principal Amount"),
                        keyboardType: TextInputType.number,
                      )),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _interestRate,
                        decoration: InputDecoration(labelText: "Interest Rate"),
                        keyboardType: TextInputType.number,
                      )),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: TextField(
                                controller: _tenure,
                                decoration:
                                    InputDecoration(labelText: "Tenure"),
                                keyboardType: TextInputType.number,
                              )),
                          Flexible(
                              flex: 1,
                              child: Column(children: [
                                design.Txtvolk(_tenureType, FontWeight.w400, 12,
                                    Colors.black),
                                Switch(
                                    value: _switchValue,
                                    onChanged: (bool value) {
                                      print(value);

                                      if (value) {
                                        _tenureType = _tenureTypes[1];
                                      } else {
                                        _tenureType = _tenureTypes[0];
                                      }
//TODO: Try To Avoid This SetState Here
                                      setState(() {
                                        _switchValue = value;
                                      });
                                    })
                              ]))
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<CounterCubit>(context).increment(
                            a: _principalAmount.text,
                            b: _interestRate.text,
                            c: _tenure.text,
                            d: _tenureType);
                      },
                      child: Container(
                        width: 140,
                        height: 50,
                        decoration: design.boxdec(),
                        child: Center(
                          child: design.Txtvolk(
                              'Calculate', FontWeight.w400, 28, Colors.black),
                        ),
                      ),
                    );
                  }),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return emiResultsWidget(state.counterValue);
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget emiResultsWidget(emiResult) {
    var canShow = true;
    if (emiResult == 0) {
      canShow = false;
    }

    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: canShow
            ? Column(children: [
                design.Txtvolk(
                    'Your Monthly EMI is', FontWeight.w400, 20, Colors.black),
                Container(
                  child: design.Txtvolk(
                      '${emiResult}', FontWeight.w400, 24, Colors.black),
                )
              ])
            : Container());
  }
}
