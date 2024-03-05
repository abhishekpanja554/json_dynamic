import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    required this.jsonData,
    this.registry,
    Key? key,
  })  : assert(jsonData != null),
        super(key: key);

  final Map<String, dynamic> jsonData;
  final JsonWidgetRegistry? registry;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStatefulWidget> {
  var _data;
  @override
  void initState() {
    super.initState();

    _data = JsonWidgetData.fromDynamic(widget.jsonData, registry: widget.registry);
  }

  @override
  Widget build(BuildContext context) => _data.build(
        context,
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> json = {
    "type": "scaffold",
    "args": {
      "appBar": {
        "type": "app_bar",
        "args": {
          "title": {
            "type": "text",
            "args": {"text": "Checkbox"}
          }
        }
      },
      "body": {
        "type": "center",
        "args": {
          "child": {
            "type": "column",
            "args": {
              "mainAxisSize": "min",
              "children": [
                {
                  "type": "row",
                  "args": {
                    "mainAxisSize": "min",
                    "children": [
                      {
                        "type": "checkbox",
                        "args": {"label": "Checked", "value": true}
                      },
                      {
                        "type": "text",
                        "args": {"text": "Checked"}
                      }
                    ]
                  }
                },
                {
                  "type": "row",
                  "args": {
                    "mainAxisSize": "min",
                    "children": [
                      {
                        "type": "checkbox",
                        "args": {"label": "Not Checked", "value": false}
                      },
                      {
                        "type": "text",
                        "args": {"text": "Not Checked"}
                      }
                    ]
                  }
                },
                {
                  "type": "row",
                  "args": {
                    "mainAxisSize": "min",
                    "children": [
                      {
                        "type": "checkbox",
                        "args": {"enabled": false, "label": "Disabled"}
                      },
                      {
                        "type": "text",
                        "args": {"text": "Disabled"}
                      }
                    ]
                  }
                },
                {
                  "type": "row",
                  "args": {
                    "mainAxisSize": "min",
                    "children": [
                      {
                        "type": "checkbox",
                        "args": {
                          "label": "OnChanged example",
                          // "onChanged": "${setBooleanValue('changedValue')}"
                        }
                      },
                      {
                        "type": "text",
                        "listen": ["changedValue"],
                        "args": {"text": "true"}
                      }
                    ]
                  }
                }
              ]
            }
          }
        }
      }
    }
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MyStatefulWidget(
        jsonData: json, registry: JsonWidgetRegistry.instance);
  }
}
