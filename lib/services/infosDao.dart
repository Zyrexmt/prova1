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
            if (response.statusCode == 200) {
                String jsonString = await response.transform(utf8.decoder).join();
                user = jsonDecode(jsonString);
                print('🔹 JSON do login: $jsonString');
            } else {
                user = '';
                print('Erro ${response.statusCode}');
            }
        } catch (e) {
            print('Erro na requisicao: $e');
        }
    }

    Future<void> registrarUsuario(String nome, String cidade, String curso, String email, String senha) async {
      try {
        final HttpClient client = HttpClient();
        final HttpClientRequest request = await client.postUrl(
            Uri.parse('http://10.0.2.2:3000/alunos'),
        );

        request.headers.set(
          HttpHeaders.contentTypeHeader, 
          'application/json; charset=utf-8'
          );

          request.write(jsonEncode({'nome_completo': nome, 'cidade': cidade, 'curso': curso, 'email': email, 'senha': senha}));
          final HttpClientResponse response = await request.close();
          print(nome);
          print(cidade);
          print(curso);
          print(email);
          print(senha);

          if(response.statusCode == 201) {
            String jsonString = await response.transform(utf8.decoder).join();
            print('Usuario cadastrado com sucesso!: $jsonString');
            final data = jsonDecode(jsonString);
            user = data['aluno'];
            print('🔹 JSON do cadastro: $jsonString');
          } else {
            print('Erro no cadastro!: ${response.statusCode}');
          }
      } catch (e) {
        print('Erro na requisicao: $e');
      }
    }

    Future<List<dynamic>> rankingTop10(int alunoId) async {
      try {
        final client = HttpClient();
        final request = await client.getUrl(
          Uri.parse("http://10.0.2.2:3000/ranking-top10/$alunoId"),
        );

        final response = await request.close();
        if(response.statusCode == 200) {
          String jsonString = await response.transform(utf8.decoder).join();
          final dados = jsonDecode(jsonString); 

          return dados['ranking'] ?? [];
        } else {
          print('Erro ao buscar ranking: ${response.statusCode}');
          return [];
        }
      } catch (e) {
        print('Erro ao buscar ranking: $e');
        return [];
      }
    }


    Future<List<dynamic>> buscarDisciplinas(int alunoId) async {
      try {
        final client = HttpClient();
        final request = await client.getUrl(
          Uri.parse("http://10.0.2.2:3000/disciplinas-usuario/$alunoId")
        );
        final response = await request.close();

        if(response.statusCode == 200) {
          String jsonString = await response.transform(utf8.decoder).join();
          final data = jsonDecode(jsonString);
          return data;
        } else {
          print("Erro ao buscar disciplinas: ${response.statusCode}");
          return [];
        }
      }catch (e) {
        print('Erro ao buscar disciplinas: $e');
        return [];
      }
    } 

}