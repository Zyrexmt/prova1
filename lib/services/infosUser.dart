import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prova1_2/global/variaveis.dart';

class Infosuser {
  Future<File> getFile() async {
    final directory = Directory.systemTemp;
    return File('${directory.path}/user.json');
  }

  Future<void> salvarInfo(dynamic user, bool conectado) async {
    final file = await getFile();
    await file.writeAsString(jsonEncode({'user': user,'conectado': conectado}));
  }

  Future<bool> userConectado() async {
    final file = await getFile();
    bool conectado = false;
    if(await file.exists()) {
      String jsonString = await file.readAsString();
      user = jsonDecode(jsonString);
      conectado = jsonDecode(jsonString)['conectado'];
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    final file = await getFile();
    if (await file.exists()){
      user = '';
      file.delete(recursive: true);
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final file = await getFile();
    if (await file.exists()){
      final jsonString = await file.readAsString();
      final data = jsonDecode(jsonString);
      return data['user'];
    }
    return null;
  } 
}