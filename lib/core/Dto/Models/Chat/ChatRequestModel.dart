


class ChatRequestModel {
  String? documentName;
  int? frequencyPenalty;
  int? maxTokens;
  List<MessagesModel>? messages;
  String? model;
  int? presencePenalty;
  bool? stream;
  double? temperature;
  int? topP;
  int? workspaceId;

  ChatRequestModel(
      {this.documentName,
        this.frequencyPenalty,
        this.maxTokens,
        this.messages,
        this.model,
        this.presencePenalty,
        this.stream,
        this.temperature,
        this.topP,
        this.workspaceId});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['document_name'] = documentName ?? 'New Document';
    data['frequency_penalty'] = frequencyPenalty ?? 0;
    data['max_tokens'] = maxTokens ?? 100;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['model'] = model ?? 'gpt-3.5-turbo-0125';
    data['presence_penalty'] = presencePenalty ?? 0;
    data['stream'] = stream ?? true;
    data['temperature'] = temperature ?? 0.3;
    data['top_p'] = topP ?? 1;
    data['workspace_id'] = workspaceId ?? 245;
    return data;
  }
}

class MessagesModel {
  String? content;
  String? role;

  MessagesModel({this.content, this.role});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content ?? 'you are a helpful assistant.';
    data['role'] = role ?? 'system';
    return data;
  }
  bool get isUser => role == 'user';

}