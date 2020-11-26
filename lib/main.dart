import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String cipher = '';
  final _controller = TextEditingController();

  void initState(){
    super.initState();
  }

  void array(nama) {
    setState(() {
      List<String> arrayp = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','.',','];
      List<String> arrayc = ['b','f','1','k','q','g','a','t','p','j','6','h','y','d','2','x','5','x','m','v','7','c','8','4','i','9','n','r','e','u','3','l','s','w',',','.','o','z','0'];
      var text = nama;

      for (int a = 0; a < text.length;a++){
        var ambil = text[a];
        // print(ambil);
        if (ambil != ' '){
          for(int b = 0;b < arrayp.length;b++){
            if (ambil == arrayp[b]){
              var huruf = arrayp[b];
              int chipher = arrayp.indexOf(huruf);
              var hasil = arrayc[chipher];
              cipher = cipher + hasil;
            }
          }
        } else if (ambil == ' '){
          cipher = cipher + ' ';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Plain Text',
            ),
            Container(
              margin: const EdgeInsets.only(left: 200.0, right: 200.0),
              child: (
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Masukkan plain text'
                  ),
                  controller: _controller,
                )
              ),
            ),
            Text(
              'Cipher Text',
            ),
            Text(
              '$cipher',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          array(_controller.text);
        },
        tooltip: 'Increment',
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
