import 'package:Quarentena_Tech/screens/homepage.dart';
import 'package:Quarentena_Tech/services/sharedPref.dart';
import 'package:Quarentena_Tech/widgets/logo.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final SharedPref _sharedPref = new SharedPref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text(
              'Nesse momento complicado que estamos passando, felizmente têm muitas pessoas, comunidades e empresas realizando pequenos eventos, 100% online e de graça pra galera. A comunidade da CollabCode criou esse site com o objetivo de juntar todas essas iniciativas maravilhosas que estão nos ajudando a passar por essa crise de uma forma mais feliz!',
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              size: 36,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () async {
              _sharedPref.save('redirect', true);
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                ModalRoute.withName('/home'),
              );
            },
          )
        ],
      ),
    );
  }
}
