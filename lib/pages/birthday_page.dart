import 'package:flutter/material.dart';
import 'secend_page.dart'; // استدعاء الصفحة الثانية

class BirthdayPage extends StatelessWidget {
  final TextEditingController _nameController =
      TextEditingController(); // نص التحكم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // لمنع التغيير عند ظهور لوحة المفاتيح
      backgroundColor: const Color.fromARGB(255, 177, 86, 148),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'HAPPY',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    Text(
                      'BIRTHDAY',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    const SizedBox(height: 20),
                    // خانة النص
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // صورة ثابتة
            Image.asset(
              'assets/cupcake.png',
              width: 500,
              height: 350,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 50),
            // الزر أسفل الشاشة
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ElevatedButton(
                onPressed: () {
                  final userName = _nameController.text;
                  if (userName.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecendPage(userName: userName),
                      ),
                    );
                  }
                },
                child: Text(
                  'Message',
                  style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
