class notes {
  String? status;
  List<Data>? data;

  notes({this.status, this.data});

  notes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? notesId;
  String? notesTitle;
  String? notesContent;
  String? notesImage;
  int? notesUser;

  Data(
      {this.notesId,
        this.notesTitle,
        this.notesContent,
        this.notesImage,
        this.notesUser});

  Data.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesImage = json['notes_image'];
    notesUser = json['notes_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.notesId;
    data['notes_title'] = this.notesTitle;
    data['notes_content'] = this.notesContent;
    data['notes_image'] = this.notesImage;
    data['notes_user'] = this.notesUser;
    return data;
  }
}
