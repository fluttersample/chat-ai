

import 'dart:async';
import 'dart:convert';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Helper/Api.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as l;
class NetWorkServices {
  static Future<Response> chatWithAi() async {



    try {
      final data = jsonEncode({
        'messages': [
          {"content": "You are a helpful assistant", "role": "system"},
          {"content": "Hi", "role": "user"}
        ],
        "model": "deepseek-coder",
        "frequency_penalty": 0,
        "max_tokens": 1000,
        "presence_penalty": 0,
        "stop": null,
        "stream": true,
        "temperature": 1,
        "top_p": 1
      });
      var result = await BaseBrain.dio.post('/chat/completions', data: data).then((response) {


        // print("ASDSA ${jsonDecode(response.requestOptions.data)['messages']}");

        // for (var element in (response.data as List<dynamic>)) {
        //   print(element);
        // }
        print('ASDSA ${response.data}');

        return response;
      });

      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  static Future<Response> chatWriter()async{

    final data = {
    "document_name": "New Document",
    "frequency_penalty": 0,
    "max_tokens": 100,
    "messages": [
    {
      "content": "you are a helpful assistant.",
    "role": "system"
    },
    {
    "content": "",
    "role": "user"
    }
    ],
    "model": "gpt-3.5-turbo-0125",
    "presence_penalty": 0,
    "stream": true,
    "temperature": 0.3,
    "top_p": 1,
    "workspace_id": 245
    };
    try{
      var result = await BaseBrain.dio.post(Api.GENERATE_AI_WRITER,data: data).then((response) {

        // final parsed = json.decode(response.data).cast<Map<String, dynamic>>();

        List<dynamic> jsonList = (response.data as String)
            .split('data:')
            .map((jsonItem) {

              return jsonItem;
            })
            .toList();
        jsonList.removeAt(0);
        List<ChatResponseModel> _dl =[];
        for (var element in jsonList) {
          _dl.add(ChatResponseModel.fromJson(jsonDecode(element)));
        }

        String combinedContent = jsonList
            .map((item) {
              final result = jsonDecode(item);
              final text = result['content'] as String?;
              return text ?? '';
            })
            .join("");
        print('cccccc ${combinedContent ?? ''}');
      });
      return result;

    }catch(e){
      rethrow;
    }
  }
}
