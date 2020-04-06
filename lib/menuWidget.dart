import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/config.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: ClayContainer(
              color: primaryColor,
              height: 200,
              width: 200,
              borderRadius: 200,
              child: Container(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/howto/img_avatar.png',
                      scale: 1000),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 50),
                  ClayContainer(
                    color: primaryColor,
                    borderRadius: 80,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClayContainer(
                    color: primaryColor,
                    borderRadius: 80,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Conta',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClayContainer(
                    color: primaryColor,
                    borderRadius: 80,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Configurações',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClayContainer(
                    color: primaryColor,
                    borderRadius: 80,
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        title: Text(
                          'LogOut',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
