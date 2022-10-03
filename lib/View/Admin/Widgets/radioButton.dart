import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:
   
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading:  Icon(Icons.photo),
                            title:  Text('Photo'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading:  Icon(Icons.music_note),
                            title:  Text('Music'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading:  Icon(Icons.videocam),
                            title:  Text('Video'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading:  Icon(Icons.share),
                            title:  Text('Share'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
            
              },
              // padding:
              //     EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              // color: Colors.pink,
              child: Text(
                'Click Me',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            ),
     
        );
   
  }
}
