import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum_pab/pages/aktivitas/aktivitas_3/aktivitas_3_page.dart';
import '../../../helpers/navigation_helper.dart';

class Aktivitas4Pin extends StatefulWidget {
  const Aktivitas4Pin({super.key});

  @override
  State<Aktivitas4Pin> createState() => _Aktivitas4PinState();
}

class _Aktivitas4PinState extends State<Aktivitas4Pin> {
  static const String _mockPin = '1234';
  final TextEditingController pinController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  void showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> showSuccessDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('PIN Benar'),
          content: const Text('PIN berhasil diverifikasi.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> verifyPin() async {
    final String pin = pinController.text.trim();

    if (pin.isEmpty) {
      setState(() {
        errorMessage = 'PIN tidak boleh kosong';
      });
      return;
    }

    if (pin.length != 4) {
      setState(() {
        errorMessage = 'PIN harus terdiri dari 4 digit';
      });
      return;
    }
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      if (pin == _mockPin) {
        await showSuccessDialog();
        if (!mounted) return;
        goToPage(context, const Aktivitas3Page());
      } else {
        setState(() {
          errorMessage = 'PIN salah. Gunakan PIN mock 1234.';
        });
      }
    } catch (_) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Terjadi kesalahan saat memverifikasi PIN lokal.';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas 4 - PIN'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter your PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Please enter your PIN that you have created',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.lock_outline, size: 80, color: Colors.red),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: pinController,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    onChanged: (_) {
                      if (errorMessage == null) return;
                      setState(() {
                        errorMessage = null;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '****',
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.6,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
                if (errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: 96,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : verifyPin,
                    child: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.lock_open_outlined, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
