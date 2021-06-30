class Bukhari {
  String name;
  List<Books> books;

  Bukhari({this.name, this.books});

  Bukhari.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['books'] != null) {
      books = new List<Books>.empty(growable: true);
      json['books'].forEach((v) {
        books.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  String name;
  List<Hadiths> hadiths;

  Books({this.name, this.hadiths});

  Books.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['hadiths'] != null) {
      hadiths = new List<Hadiths>.empty(growable: true);
      json['hadiths'].forEach((v) {
        hadiths.add(new Hadiths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.hadiths != null) {
      data['hadiths'] = this.hadiths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadiths {
  String info;
  String bukhariNo;
  String by;
  String text;

  Hadiths({this.info, this.bukhariNo, this.by, this.text});

  Hadiths.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    bukhariNo = json['bukhariNo'];
    by = json['by'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = this.info;
    data['bukhariNo'] = this.bukhariNo;
    data['by'] = this.by;
    data['text'] = this.text;
    return data;
  }
}
