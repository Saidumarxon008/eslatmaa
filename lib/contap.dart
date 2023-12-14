import 'package:flutter/material.dart';
import 'package:flutter_mashgulot/MyApp.dart';
import 'package:flutter_mashgulot/add.dart';
import 'package:flutter_mashgulot/ended/end2.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
class Contap extends StatefulWidget {
  final int? index;

  const Contap({super.key, this.index});

  @override
  State<Contap> createState() => _ContapState();
}

class _ContapState extends State<Contap> {
  TextEditingController textEditingController = TextEditingController();
  bool _icon = false;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      textEditingController =
          TextEditingController(text: textBox.getAt(widget.index!)!.content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      extendBody: true,
      body:
      Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color: Colors.yellow[300],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                if (_icon == true) {
                                  setState(() {
                                    _icon = false;
                                  });
                                } else {
                                  setState(() {
                                    _icon = true;
                                  });
                                }
                              },
                              icon: Icon((_icon == false)
                                  ? AntDesign.staro
                                  : AntDesign.star),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: textEditingController,
                        textAlignVertical: TextAlignVertical.center,
                        minLines: 1,
                        maxLines: null,
                        readOnly: true,
                        keyboardType: TextInputType.multiline,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Add(
                                    index: widget.index,
                                  )));
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 70),
                          hintText: "  Yozuv",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow[300],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EndIkki(
                          index: widget.index,
                        )));
              },
              child: const Icon(Icons.done_outline),
            ),
            label: "Yakunlash",),
          BottomNavigationBarItem(
            icon: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Add(
                          index: widget.index,
                        )));
              },
              child: const Icon(MaterialCommunityIcons.pen),
            ),
            label: "Tahrirlash",
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
                onPressed: () {
                  setState(() {
                    textBox.deleteAt(widget.index!);
                    textEditingController.clear();
                    Navigator.pop(context);
                  });
                },
                child: const Icon(
                  AntDesign.delete,
                )),
            label: "O'chirish",
          ),
        ], currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}