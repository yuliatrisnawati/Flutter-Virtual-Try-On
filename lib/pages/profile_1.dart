import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(11, 12, 10, 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 11, 10.9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 1.1, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 55),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFECF4F7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(19, 15.3, 0, 16.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 13.7,
                                  height: 23.3,
                                  child: SizedBox(
                                    width: 13.7,
                                    height: 23.3,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_3_x2.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 3.7, 0, 0.7),
                                  child: Text(
                                    'Profile',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 47),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/whats_app_image_20240521_at_14131.jpeg',
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -8.2,
                            top: -6.8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFECF4F7),
                                borderRadius: BorderRadius.circular(19.8),
                              ),
                              child: Container(
                                width: 39.5,
                                height: 39.5,
                              ),
                            ),
                          ),
                          Container(
                            width: 158,
                            height: 158,
                            padding: EdgeInsets.fromLTRB(15, 125.3, 15, 8.2),
                            child: Container(
                              width: 23.2,
                              height: 24.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      'assets/images/compact_camera.png',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 23.2,
                                  height: 24.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 197.4, 22),
                    child: Text(
                      'Full Name',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 128.4, 32),
                    child: Text(
                      'DMITRIEV ABRAHAM',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 229.2, 22),
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 127.2, 32),
                    child: Text(
                      'abesteg0@gmail.com',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF000000),
                        decorationColor: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 214.5, 7),
                    child: Text(
                      'Gender',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 22, 56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0x26B1B2B7),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(18, 15, 29.7, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: SizedBox(
                              width: 224.7,
                              child: Text(
                                'Laki-laki',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Color(0x80070707),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFFDAEAF1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        offset: Offset(0, 4),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: 106,
                                    padding: EdgeInsets.fromLTRB(0, 12, 2, 12),
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 19,
              right: 23,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0x26B1B2B7),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 297,
                  height: 46,
                ),
              ),
            ),
            Positioned(
              left: 17,
              right: 25,
              bottom: 400,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0x26B1B2B7),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Container(
                  width: 297,
                  height: 46,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
