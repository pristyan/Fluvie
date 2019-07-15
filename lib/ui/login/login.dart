import 'package:flutter/material.dart';
import 'package:flutter_movie/style/dimens.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
    }
  }

  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Select Source"),
            children: <Widget>[
              SimpleDialogOption(
                child: Row(
                  children: <Widget>[
                    Text("Camera"),
                  ],
                ),
                onPressed: () => Navigator.pop(context, 1),
              ),
              SimpleDialogOption(
                child: Text("Galery"),
                onPressed: () => Navigator.pop(context, 2),
              )
            ],
          );
        })) {
      case 1:
        print("Camera from case");
        break;
      case 2:
        print("Galery from case");
        break;
    }
  }

  static const List<String> dropDownValues = [
    "First",
    "Second",
    "Third",
  ];

  String selectedItem = dropDownValues[0];

  String email = "";
  String password = "";

  bool hidePassword = true;
  bool rememberMe = false;

  void onClick() {
    print("$email | $password");
  }

  OutlineInputBorder buildBorderActiveStyle() => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(marginDefault)),
      borderSide: BorderSide(color: Colors.yellow[700], width: 1.5));

  OutlineInputBorder buildBorderInactiveStyle() => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(marginDefault)),
      borderSide: BorderSide(color: Colors.blueGrey, width: 1.0));

  Widget buildEmailField() => SizedBox(
        height: 45.0,
        child: TextField(
          onChanged: (newValue) {
            setState(() {
              email = newValue;
            });
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            labelText: "Email",
            border: buildBorderInactiveStyle(),
            focusedBorder: buildBorderActiveStyle(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget buildPasswordField() => SizedBox(
        height: 45.0,
        child: TextField(
          onChanged: (newValue) {
            setState(() {
              password = newValue;
            });
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: "Password",
              border: buildBorderInactiveStyle(),
              focusedBorder: buildBorderActiveStyle(),
              suffixIcon: IconButton(
                padding: EdgeInsets.all(marginSmall),
                onPressed: () {
                  setState(() {
                    hidePassword ? hidePassword = false : hidePassword = true;
                  });
                },
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              )),
          obscureText: hidePassword,
        ),
      );

  Widget buildLoginButton() => SizedBox(
        width: 230.0,
        height: 45.0,
        child: FlatButton(
          onPressed: onClick,
          child: Text(
            "Login",
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          color: Colors.blueGrey,
          highlightColor: Colors.blueGrey[900],
          textColor: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: SizedBox(
            width: 250.0,
            height: 250.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: marginDefault),
                        child: buildEmailField()),
                    Padding(
                      padding: EdgeInsets.only(top: marginDefault),
                      child: buildPasswordField(),
                    ),
                    IconButton(
                      icon: Icon(Icons.event),
                      onPressed: () {
                        openDialog();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: marginDefault),
                      child: buildLoginButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
