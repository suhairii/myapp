import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:myapp/third.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  String _message = "";

  void _sendSMS(List<String> numbers, String message) async {
    try {
      String _result = await sendSMS(message: message, recipients: numbers);
      setState(() => _message = _result);
    } catch (error) {
      setState(() => _message = error.toString());
    }
  }

  void openSMS({required List<String> numbers, required String message}) async {
    String smsUri = 'sms:${numbers.join(",")}?body=${Uri.encodeComponent(message)}';
    if (await canLaunch(smsUri)) {
      await launch(smsUri);
    } else {
      setState(() => _message = 'Could not open SMS app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Demo kirim SMS'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _numController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nomor handphone',
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: _msgController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Pesan SMS',
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdPage()));
              }, child: const Icon(Icons.next_plan))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Kirim SMS',
        child: const Icon(Icons.sms),
        onPressed: () {
          List<String> numbers = [_numController.text];
          openSMS(numbers: numbers, message: _msgController.text);
        },
        
      ),
    );
  }
}
