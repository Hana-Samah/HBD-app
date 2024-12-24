import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء شعار Debug
      home: BirthdayPage(), // الصفحة الرئيسية
    );
  }
}

class BirthdayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 217, 223), // لون الخلفية
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 153, 217, 223), // شفاف يشبه الخلفية
        elevation: 0, // إزالة الظل
        toolbarHeight: 200, // تعديل ارتفاع شريط العنوان
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '🎉Happy Birthday Rema🎉',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '-from Hana',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    'HAPPY',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  Text(
                    'BIRTHDAY',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/cupcake.png',
              width: 500,
              height: 600,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPage()),
                  );
                },
                child: Text('Secret Page'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 229, 211), // لون خلفية جديد
      appBar: AppBar(
        title: Text('Welcome Rema'),
        backgroundColor:
            Color.fromARGB(172, 201, 98, 167), // لون مميز للشريط العلوي
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 100,
              color: Color.fromARGB(253, 202, 118, 174), // أيقونة مميزة
            ),
            SizedBox(height: 20),
            Text(
              '🌟 To my dear friend, 🌟\n\n'
              'You are like a shining star in my life, bringing light, joy, and laughter wherever you go.\n'
              'I wish you a world filled with endless happiness, success that knows no bounds, and love that surrounds you every single day.\n\n'
              'May your dreams soar high, and may you always have reasons to smile, no matter what.\n\n'
              'Thank you for being the amazing person that you are! 💖✨',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
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
                Navigator.pop(context); // الرجوع إلى الصفحة السابقة
              },
              child: Text(
                'Back to Birthday Page',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
