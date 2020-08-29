import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomToggleButtons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => MyHomePage(title: "CustomToggleButtons Home"),
        "/defaultIcons": (context) =>
            MyHomePage(
              title: "Default Icons",
              widget: DefaultIcons(),
            ),
        "/verticalAlignment": (context) =>
            MyHomePage(
              title: "Vertically aligned",
              widget: VerticalAligned(),
            ),
        "/borderStyling": (context) =>
            MyHomePage(
              title: "Border Styling",
              widget: BorderStyling(),
            ),
        "/colorStyling": (context) =>
            MyHomePage(
              title: "Color Styling",
              widget: ButtonColors(),
            ),
        "/spacingElevation": (context) =>
            MyHomePage(
              title: "Spacing and Elevation",
              widget: SpacingAndElevation(),
            ),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.widget}) : super(key: key);
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: widget ??
          ListView(
            children: <Widget>[
              ListTile(
                title: Text("Default without styling"),
                subtitle: Text("No special rules, just multiple icon lengths"),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, "/defaultIcons"),
              ),
              ListTile(
                title: Text("Vertically aligned"),
                subtitle: Text("Vertical alignment with Icons and Text"),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, "/verticalAlignment"),
              ),
              ListTile(
                title: Text("Border Styling"),
                subtitle: Text("Variety of styles added to borders"),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, "/borderStyling"),
              ),
              ListTile(
                title: Text("Button Colors"),
                subtitle: Text("Set different color styles to buttons"),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, "/colorStyling"),
              ),
              ListTile(
                title: Text("Spacing and Elevation"),
                subtitle:
                Text("Set space between buttons and provide elevation"),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, "/spacingElevation"),
              ),
            ],
          ),
    );
  }
}

class DefaultIcons extends StatefulWidget {
  @override
  _DefaultIconsState createState() => _DefaultIconsState();
}

class _DefaultIconsState extends State<DefaultIcons> {
  List<bool> _isSelected2 = [false, false];
  List<bool> _isSelected3 = [true, false, false];
  List<bool> _isSelected5 = [true, false, false, true, false];
  List<bool> _isSelected10 = [
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    false,
    true,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
          ),
          CustomToggleButtons(
            isSelected: _isSelected3,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.refresh),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected3[index] = !_isSelected3[index];
              });
            },
          ),
          CustomToggleButtons(
            isSelected: _isSelected5,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.refresh),
              Icon(Icons.cake),
              Icon(Icons.toys),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected5[index] = !_isSelected5[index];
              });
            },
          ),
          CustomToggleButtons(
            isSelected: _isSelected10,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.refresh),
              Icon(Icons.cake),
              Icon(Icons.toys),
              Icon(Icons.ac_unit),
              Icon(Icons.airplanemode_active),
              Icon(Icons.assessment),
              Icon(Icons.brush),
              Icon(Icons.child_friendly),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected10[index] = !_isSelected10[index];
              });
            },
          ),
        ],
      ),
    );
  }
}

class VerticalAligned extends StatefulWidget {
  @override
  _VerticalAlignedState createState() => _VerticalAlignedState();
}

class _VerticalAlignedState extends State<VerticalAligned> {
  List<bool> _isSelected2 = [false, false];
  List<bool> _isSelected3 = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[Icon(Icons.add), Icon(Icons.remove)],
            direction: Axis.vertical,
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
          ),
          CustomToggleButtons(
            isSelected: _isSelected3,
            children: <Widget>[
              Text("A"),
              Text("B"),
              Text("C"),
            ],
            direction: Axis.vertical,
            onPressed: (index) {
              setState(() {
                _isSelected3[index] = !_isSelected3[index];
              });
            },
          ),
        ],
      ),
    );
  }
}

class BorderStyling extends StatefulWidget {
  @override
  _BorderStylingState createState() => _BorderStylingState();
}

class _BorderStylingState extends State<BorderStyling> {
  List<bool> _isSelected2 = [false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Borderless
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            renderBorder: false,
          ),
          // Thick borders with color
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            borderWidth: 3,
            borderColor: Colors.red,
            selectedBorderColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class ButtonColors extends StatefulWidget {
  @override
  _ButtonColors createState() => _ButtonColors();
}

class _ButtonColors extends State<ButtonColors> {
  List<bool> _isSelected2 = [false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // selected and unselected state colors
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            color: Colors.red,
            selectedColor: Colors.black,
            fillColor: Colors.red,
            unselectedFillColor: Colors.black,
            renderBorder: false,
          ),
          // Splash Color
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            selectedColor: Colors.red,
            splashColor: Colors.red,
            renderBorder: false,
          ),
          // Disabled Color
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            disabledColor: Colors.black45,
            disabledFillColor: Colors.grey,
            renderBorder: false,
          ),
        ],
      ),
    );
  }
}

class SpacingAndElevation extends StatefulWidget {
  @override
  _SpacingAndElevationState createState() => _SpacingAndElevationState();
}

class _SpacingAndElevationState extends State<SpacingAndElevation> {
  List<bool> _isSelected2 = [false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Spacing horizontal
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            borderColor: Colors.black,
            spacing: 10,
          ),
          // Spacing vertical
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            direction: Axis.vertical,
            borderColor: Colors.black,
            spacing: 10,
          ),
          // Elevation
          CustomToggleButtons(
            isSelected: _isSelected2,
            children: <Widget>[
              Icon(Icons.add),
              Icon(Icons.remove),
            ],
            onPressed: (index) {
              setState(() {
                _isSelected2[index] = !_isSelected2[index];
              });
            },
            elevation: 8,
          ),
        ],
      ),
    );
  }
}
