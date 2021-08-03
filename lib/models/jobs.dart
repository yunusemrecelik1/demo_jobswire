
class Jobs {
  String? id;
  String? date;
  String? company;
  String? description;
  String? logo;
  String? location;
  String? position;
  List<String?> tags = [];
  Jobs({this.id,this.date,this.company,this.description,this.logo,this.location,this.position});
  Jobs.fromMap(Map<String,dynamic> data){
    id = data["id"];
    date = data["date"];
    company = data["company"];
    description = data["description"];
    logo = data["logo"];
    location = data["location"];
    position = data["position"];
    for (var element in data["tags"] ?? []) {
      this.tags.add(element.toString());
    }
  }
}