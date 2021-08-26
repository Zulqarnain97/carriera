import 'package:flutter/cupertino.dart';

class BlogsItem {
  int blogID;
  String bloggerName;
  String bloggDescription;
  String bloggerQuote;
  String bloggerReview;
  String bloggerImage;
  //String blogVideo;
//  String blogVideoLink;
  String blogDate;
  String blogCreated_at;
  String blogUpdated_at;

  BlogsItem(
      { this.blogID,
         this.bloggerName,
         this.bloggDescription,
         this.bloggerQuote,
         this.bloggerReview,
         this.bloggerImage,
        //   this.blogVideo,
        //   this.blogVideoLink,
         this.blogDate,
         this.blogCreated_at,
         this.blogUpdated_at});

  factory BlogsItem.fromDocument(AsyncSnapshot doc, index) {
    return BlogsItem(
      blogID: doc.data[index]['id'],
      bloggerName: doc.data[index]['name'],
      bloggDescription: doc.data[index]['description'],
      bloggerQuote: doc.data[index]['quote'],
      bloggerReview: doc.data[index]['review'],
      bloggerImage: doc.data[index]['image'],
      //  blogVideo: doc.data[index]['video'],
      // blogVideoLink: doc.data[index]['link'],
      blogDate: doc.data[index]['date'],
      blogCreated_at: doc.data[index]['created_at'],
      blogUpdated_at: doc.data[index]['updated_at'],
    );
  }
}