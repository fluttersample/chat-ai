


class ChatResponseModel {
  String? content;
  String? functionCall;
  String? role;
  String? toolCalls;
  String? refusal;

  ChatResponseModel(
      {this.content,
        this.functionCall,
        this.role,
        this.toolCalls,
        this.refusal});

  ChatResponseModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    functionCall = json['function_call'];
    role = json['role'];
    toolCalls = json['tool_calls'];
    refusal = json['refusal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['function_call'] = functionCall;
    data['role'] = role;
    data['tool_calls'] = toolCalls;
    data['refusal'] = refusal;
    return data;
  }




}
