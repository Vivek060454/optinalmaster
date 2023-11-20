import 'package:flutter/material.dart';

var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text = " " + this_year; //this shows in the splash screen

  //Default language config

  static const bool HTTPS = true;

  //configure this
  // static const DOMAIN_PATH = "192.168.6.1/ecommerce"; //localhost
  static const DOMAIN_PATH = "businessapps.in"; //inside a folder


  //do not configure these below
  static const String API_ENDPATH = "options_master";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";
}
