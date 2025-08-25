import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:prova1_2/global/variaveis.dart';

class InfosDao {
    Future<void> validarLogin(String email, String senha) async {
        try {
            final HttpClient client = HttpClient();
            final HttpClientRequest request = await client.postUrl(
                Uri.parse('http://10.0.2.2:3000/login'),
            );

            request.headers.set(
                HttpHeaders.contentTypeHeader,
            'application/json; charset=utf-8',
            );

            request.write(jsonEncode({'email': email, 'senha': senha}));

            final HttpClientResponse response = await request.close();

            print(email);
            print(senha);
            if (response.statusCode == 200) {
                String jsonString = await response.transform(utf8.decoder).join();
                user = jsonDecode(jsonString);
            } else {
                user = '';
                print('Erro ${response.statusCode}');
            }
        } catch (e) {
            print('Erro na requisicao: $e');
        }
    }
}