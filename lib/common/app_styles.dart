import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/common/app_colors.dart';

class AppStyles {
 static SizedBox sizedBoxStyle({  double height = 10}){
   return SizedBox(
     height: height,
   );
 }

 static Widget iconSvgStyle({pathImage,width = 20.0,height = 20.0}){
   return SvgPicture.asset(
     pathImage,
     width: width,
     height: height,
   );
 }
 static  boxDecorationAssetImageStyle({String ?pathAssetImage}){
   return BoxDecoration(
     image: DecorationImage(
       fit: BoxFit.cover,
       image: AssetImage(pathAssetImage!),
     ),
   );

 }
 static  boxDecorationNetworkImageStyle({String ?pathNetworkImage,BorderRadius ?borderRadius}){
   return BoxDecoration(
     image: DecorationImage(
       fit: BoxFit.cover,
       image: NetworkImage(pathNetworkImage!),
     ),
     borderRadius: borderRadius,
   );

 }
  static TextStyle textStyle(
      {String fontFamily = 'Medium',
      FontWeight fontWeight = FontWeight.normal,
      Color color = AppColors.secondaryColor,
      double fontSize = 14,}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
