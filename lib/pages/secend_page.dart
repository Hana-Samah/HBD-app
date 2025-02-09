import 'package:flutter/material.dart';
import 'audio_list_page.dart';

class SecendPage extends StatelessWidget {
  final String userName; // تعريف المتغير لاستقبال اسم المستخدم

  // استلام الـ userName عبر المُنشئ (constructor)
  SecendPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 86, 148),
      appBar: AppBar(
        title: Text(
          'Welcome $userName',  // عرض اسم المستخدم في الـ AppBar
          style: TextStyle(
            color: const Color.fromARGB(255, 177, 86, 148),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlaywriteVN',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cake,
              size: 100,
              color: Color.fromARGB(252, 255, 255, 255),
            ),
            Text(
              '\n🌟 To my dear friend, $userName 🌟\n',  // إضافة اسم المستخدم هنا بعد "To my dear friend,"
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(221, 255, 255, 255),
                fontFamily: 'PlaywriteVN',
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'You are like a shining star in my life, bringing light, joy, and laughter wherever you go.\n'
                'I wish you a world filled with endless happiness, success that knows no bounds, and love that surrounds you every single day.\n\n'
                'May your dreams soar high, and may you always have reasons to smile, no matter what.\n\n'
                'Thank you for being the amazing person that you are! 💖✨ \n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 255, 255, 255),
                  fontFamily: 'PlayfairDisplay',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioListPage()),
                );
              },
              child: Text(
                'Go to To-Do List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
