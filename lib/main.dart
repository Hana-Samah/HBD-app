import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء شعار Debug
      home: Scaffold(
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
            // نص Happy Birthday الكبير
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
            // صورة الكب كيك
            Center(
              child: Image.asset(
                'assets/cupcake.png',
                width: 500,
                height: 600,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
