import 'package:flutter/material.dart';

class JobModel {
  final int jobID;
  final String title;
  final String company;
  final String description;
  final String skills;
  final String type;
  final String jobImage;
  final String career_level;
  final String category;
  final String qualification;
  final String min_experience;
  final String max_experience;
  final String min_salary;
  final String max_salary;
  final String preference;
  final String date;

  JobModel(
      { this.jobID,
         this.title,
         this.company,
         this.description,
         this.skills,
         this.type,
         this.jobImage,
         this.career_level,
         this.category,
         this.qualification,
         this.min_experience,
         this.max_experience,
         this.min_salary,
         this.max_salary,
         this.preference,
         this.date});

  factory JobModel.fromDocument(AsyncSnapshot doc, index) {
    return JobModel(
      jobID: doc.data[index]['id'],
      title: doc.data[index]['title'],
      company: doc.data[index]['company_name'],
      description: doc.data[index]['description'],
      skills: doc.data[index]['skills'],
      type: doc.data[index]['type'],
      jobImage: doc.data[index]['image'],
      career_level: doc.data[index]['career_level'],
      category: doc.data[index]['category'],
      qualification: doc.data[index]['qualification'],
      min_experience: doc.data[index]['min_experience'],
      max_experience: doc.data[index]['max_experience'],
      min_salary: doc.data[index]['min_salary'],
      max_salary: doc.data[index]['max_salary'],
      preference: doc.data[index]['preference'],
      date: doc.data[index]['date'],
    );
  }
}