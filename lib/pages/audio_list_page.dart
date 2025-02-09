import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:convert';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones(); // ✅ تهيئة المناطق الزمنية
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List with Notifications',
      home: AudioListPage(),
    );
  }
}

class AudioListPage extends StatefulWidget {
  @override
  _AudioListPageState createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  final List<Map<String, dynamic>> _items = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  DateTime? _selectedDate;

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _loadItems();
  }

  void _initializeNotifications() async {
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initSettings = InitializationSettings(android: androidInit);
    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> _scheduleNotification(String text, DateTime dateTime) async {
    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

    var androidDetails = AndroidNotificationDetails(
      'task_channel',
      'Task Reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    var generalNotificationDetails = NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Task Reminder',
      text,
      scheduledDate,
      generalNotificationDetails,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> itemsJson = _items.map((item) => json.encode(item)).toList();
    prefs.setStringList('audioItems', itemsJson);
  }

  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? itemsJson = prefs.getStringList('audioItems');
    if (itemsJson != null) {
      setState(() {
        _items.clear();
        _items.addAll(itemsJson.map((item) => json.decode(item) as Map<String, dynamic>));
      });
    }
  }

  void _addItem(String text, String? url, DateTime? date) {
    setState(() {
      _items.add({
        'text': text,
        'url': url ?? '',
        'checked': false,
        'date': date?.toIso8601String() ?? '',
      });
    });
    if (date != null) {
      _scheduleNotification(text, date);
    }
    _saveItems();
    _textController.clear();
    _urlController.clear();
    Navigator.of(context).pop();
  }

  void _showAddItemDialog() {
    _selectedDate = null;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  labelText: 'Enter audio URL (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      _selectedDate = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    }
                  }
                },
                child: Text('Select Date & Time'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final text = _textController.text.trim();
                  final url = _urlController.text.trim();
                  if (text.isNotEmpty) {
                    _addItem(text, url.isNotEmpty ? url : null, _selectedDate);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Text is required')),
                    );
                  }
                },
                child: Text('Add Item'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List with Notifications'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          DateTime? taskDate = item['date'].isNotEmpty ? DateTime.parse(item['date']) : null;
          return ListTile(
            title: Text(item['text']),
            subtitle: taskDate != null ? Text('Due: ${taskDate.toLocal()}') : null,
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
                _saveItems();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
