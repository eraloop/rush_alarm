
import 'package:flutter/cupertino.dart';

class NotificationModel{

  final int id;
  final String title;
  final String body;
  final String type;
  final String createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      type: json['type'],
      createdAt: json['created_at'],
    );
  }
}