
class SavedPostsResponse {
  final String status;
  final SavedData data;

  SavedPostsResponse({
    required this.status,
    required this.data,
  });

  factory SavedPostsResponse.fromJson(Map<String, dynamic> json) {
    return SavedPostsResponse(
      status: json['status'],
      data: SavedData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data.toJson(),
      };
}

class SavedData {
  final List<Audio> audios;
  final List<Quote> quotes;
  final List<Visual> visuals;

  SavedData({
    required this.audios,
    required this.quotes,
    required this.visuals,
  });

  factory SavedData.fromJson(Map<String, dynamic> json) {
    return SavedData(
      audios: (json['audios'] as List<dynamic>)
          .map((e) => Audio.fromJson(e))
          .toList(),
      quotes: (json['quotes'] as List<dynamic>)
          .map((e) => Quote.fromJson(e))
          .toList(),
      visuals: (json['visuals'] as List<dynamic>)
          .map((e) => Visual.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'audios': audios.map((e) => e.toJson()).toList(),
        'quotes': quotes.map((e) => e.toJson()).toList(),
        'visuals': visuals.map((e) => e.toJson()).toList(),
      };
}

class Audio {
  final int id;
  final String name;
  final String imgPath;
  final String audioPath;
  final int viewCount;
  final List<String> keywords;

  Audio({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.audioPath,
    required this.viewCount,
    required this.keywords,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      id: json['id'],
      name: json['name'],
      imgPath: json['img_path'],
      audioPath: json['audio_path'],
      viewCount: json['view_count'],
      keywords: List<String>.from(json['keywords']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'img_path': imgPath,
        'audio_path': audioPath,
        'view_count': viewCount,
        'keywords': keywords,
      };
}

class Quote {
  final int id;
  final int? isText;
  final String quote;
  final int viewCount;
  final List<String> keywords;

  Quote({
    required this.id,
    this.isText,
    required this.quote,
    required this.viewCount,
    required this.keywords,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      isText: json['is_text'], 
      quote: json['quote'],
      viewCount: json['view_count'],
      keywords: List<String>.from(json['keywords']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_text': isText,
        'quote': quote,
        'view_count': viewCount,
        'keywords': keywords,
      };
}

class Visual {
  final int id;
  final String imagePath;
  final int viewCount;
  final String? category;
  final List<String> keywords;

  Visual({
    required this.id,
    required this.imagePath,
    required this.viewCount,
    this.category,
    required this.keywords,
  });

  factory Visual.fromJson(Map<String, dynamic> json) {
    return Visual(
      id: json['id'],
      imagePath: json['image_path'],
      viewCount: json['view_count'],
      category: json['category'],
      keywords: List<String>.from(json['keywords']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_path': imagePath,
        'view_count': viewCount,
        'category': category,
        'keywords': keywords,
      };
}
