import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/global.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingController;
  FocusNode _textFocusNode;
  List<String> _primefactorList = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textFocusNode = FocusNode();
  }

  void _calculatePrimeFactor(double n) async {
    dynamic primeFactors = await compute(calculatePrime, n);
    setState(() {
      _primefactorList.addAll(primeFactors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate Prime Factor"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: TextField(
                  controller: _textEditingController,
                  focusNode: _textFocusNode,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  onSubmitted: (val) {
                    FocusScope.of(context).unfocus();
                  },
                )),
                Flexible(
                    child: RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_textEditingController.text != "")
                      _calculatePrimeFactor(
                          double.parse(_textEditingController.text));
                  },
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                )),
                Flexible(
                    child: RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _primefactorList.clear();
                    _textEditingController.text = "";
                    setState(() {});
                  },
                  child: Text("Reset", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                )),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(40, 30, 30, 0),
                  itemCount: _primefactorList?.length ?? 0,
                  itemBuilder: (_, index) {
                    return Text(_primefactorList[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20));
                  }),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }
}
