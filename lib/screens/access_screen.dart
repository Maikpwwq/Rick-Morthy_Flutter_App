import 'package:flutter/material.dart';
import 'package:rick_morthy_flutter_app/screens/character_screen.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  _AccessScreenState createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isloading = false;
  final String accessKey = '369';

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
  }

  void onContinue() {
    setState(() {
      _isloading = true;
    });
    String providedCode = _codeController.text.toString();
    if (providedCode.isNotEmpty) {
      if (providedCode == accessKey) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const CharacterScreen(),
          ),
        );
      } else {
        print('No coinciden los códigos');
      }
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Text('Ingrese el código de acceso suministrado'),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  hintText: 'Código',
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: onContinue,
                child: Container(
                  child: _isloading
                      ? const Center(child: CircularProgressIndicator())
                      : const Text('Continuar'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: Colors.green,
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
