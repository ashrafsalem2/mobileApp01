import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  final String title;
  const SettingPage({super.key, required this.title});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _controller = TextEditingController();
  bool? isCheck = true;
  bool isSwitch = true;
  double _sliderVal = 0.0;
  String menuItem = 'e1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Hello To Settings"),
                      duration: Duration(seconds: 5),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: "Exit",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
                child: Text('Show SnackBar'),
              ),
              Divider(height: 5.0, thickness: 5, color: Colors.teal),
              SizedBox(
                height: 50.0,
                child: VerticalDivider(thickness: 3, color: Colors.teal),
              ),
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert Title'),
                        content: Text("alert content"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("show Alert"),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text("Menu 1")),
                  DropdownMenuItem(value: 'e2', child: Text("Menu 2")),
                  DropdownMenuItem(value: 'e3', child: Text("Menu 3")),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value.toString();
                  });
                },
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              SizedBox(height: 10.0),
              Text(_controller.text),
              Checkbox.adaptive(
                value: isCheck,
                tristate: true,
                onChanged: (value) {
                  setState(() {
                    isCheck = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              CheckboxListTile.adaptive(
                value: isCheck,
                title: Text("Click Me"),
                tristate: true,
                onChanged: (value) {
                  setState(() {
                    isCheck = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              SwitchListTile.adaptive(
                value: isSwitch,
                title: Text("Swap Me"),
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              Slider.adaptive(
                max: 100,
                divisions: 10,
                value: _sliderVal,
                onChanged: (value) {
                  setState(() {
                    _sliderVal = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              Text(_sliderVal.toString()),
              SizedBox(height: 10),
              SizedBox(
                height: 300.0,
                child: GestureDetector(
                  onTap: () {
                    print("hi there");
                  },
                  child: Image.network(
                    'https://images.pexels.com/photos/128756/pexels-photo-128756.jpeg',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300.0,
                height: 300.0,
                color: Colors.white38,
                child: InkWell(splashColor: Colors.teal[600], onTap: () {}),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(onPressed: () {}, child: Text('Click Me')),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.amber[800],
                ),
                child: Text(
                  'Click Me',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              FilledButton(onPressed: () {}, child: Text('Click Me')),
              TextButton(onPressed: () {}, child: Text('Click Me')),
              OutlinedButton(onPressed: () {}, child: Text('Click Me')),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
