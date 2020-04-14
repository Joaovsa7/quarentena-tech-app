import 'package:Quarentena_Tech/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'images/logo.png',
                            width: 220,
                          ),
                          Icon(Icons.ac_unit)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Nesse momento complicado que estamos passando, felizmente têm muitas pessoas, comunidades e empresas realizando pequenos eventos, 100% online e de graça pra galera. A comunidade da CollabCode criou esse site com o objetivo de juntar todas essas iniciativas maravilhosas que estão nos ajudando a passar por essa crise de uma forma mais feliz!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 10,
                          height: 1.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      child: Menu(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
