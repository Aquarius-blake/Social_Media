
import 'package:flutter/material.dart';
import 'package:forum3/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../../Models/Users1.dart';
import '../../Services/auth.dart';



class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  State<Webview> createState() => _WebviewState();
}
final  AuthService _auth=AuthService();
String username="";



class _WebviewState extends State<Webview> {
  @override
  void initState() {
   // initial();
    super.initState();
  }
  void initial()async{
   /* DocumentSnapshot snap= await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username=(snap.data() as Map<String,dynamic>)['username'];
    });*/

    UserProvider _userprovider=Provider.of(context,listen: false);
    await _userprovider.Refreshuser();

  }
  @override
  Widget build(BuildContext context) {
    User1 user1= Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Web"),
        actions: [
          ElevatedButton(
            onPressed: ()async{
              await _auth.SignOut();
            },
            child: Text("Sign Out"),
          ),
          /*ListTile(
            leading: Icon(LineIcons.alternateSignOut),
            title: Text("Sign Out"),
            onTap: (){},
          ),*/
        ],
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(60),

            child: Center(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Card(
                        elevation: 15.0,
                        color: Colors.white,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50,50,50,50),
                          child: SingleChildScrollView(
                            child: Column(

                              children: <Widget>[
                                Stack(
                                    children:<Widget>[
                                      CircleAvatar(
                                        radius: 50.0,
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        left: 65,
                                        child: IconButton(
                                            onPressed:() {

                                            },
                                            icon:Icon(
                                              Icons.add_a_photo,
                                              color: Colors.lightBlueAccent,
                                            )
                                        ),
                                      )
                                    ]
                                ),
                                SizedBox(height: 10,),
                                Text(user1.Username!),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.person),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){},
                                      child: Text("Profile",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.mail_outline),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){},
                                      child: Text("Messages",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.search),
                                      iconSize: 40.0,

                                    ),

                                    GestureDetector(
                                      onTap: (){},
                                      child: Text("Search",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 30,),
                                TextButton(
                                    onPressed: (){},
                                    child: Text("Create New Account",
                                      style: TextStyle(

                                      ),)
                                )

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[

                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Card(
                        child: Column(

                          children: <Widget>[
                            Text("dgdfgd")
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
