class MarathonModel {
  final String id;
  final String name;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime startDate;
  final DateTime endDate;
  final String? price;
  final String? participantsQantyti;
  final String? stagesQantyti;
  final String description;
  final List<String> previewPhoto;
  MarathonModel({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.startDate,
    required this.endDate,
    this.price,
    this.participantsQantyti,
    this.stagesQantyti,
    required this.description,
    required this.previewPhoto,
  });

  static Future<MarathonModel> fromJSON(Map<String, dynamic> data) async {
    MarathonModel marathon = MarathonModel(
      id: data['id'],
      name: data['name'],
      category: data['category'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
      startDate: data['startDate'],
      endDate: data['endDate'],
      price: data['price'],
      participantsQantyti: data['participantsQantyti'],
      stagesQantyti: data['stagesQantyti'],
      description: data['description'],
      previewPhoto: data['previewPhoto'],
    );
    return marathon;
  }
}
