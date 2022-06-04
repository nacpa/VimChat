import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void CustomSnackBar(String title,String Message,Color BackgraoundColor,Color TextColor){
  Get.snackbar(title, Message,backgroundColor:BackgraoundColor,messageText:Text(Message,style: TextStyle(color:TextColor ),), );

}