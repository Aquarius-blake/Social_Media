
import 'package:flutter/material.dart';


class GroupCard extends StatefulWidget {
  final snap;
  const GroupCard({ Key? key , this.snap}) : super(key: key);

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child:Card(
        elevation: 0.0,
        color:Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(widget.snap['Group Pic']),
                radius:20,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Text(
                        "${widget.snap['Group Name']}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ),
                  SizedBox(height: 5,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: RichText(
                        text: TextSpan(
                          text:"${widget.snap['Group Description']}",)
                          ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

