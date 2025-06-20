import "dart:convert";

void main() {
  Map<String, dynamic> user = {
    "id": "87654",
    "name": "Harshit Kumar",
    "email": "harshitclub@gmail.com",
    "username": "harshitclub",
    "social": {
      "instagram": "@harshitclub",
      "linkedin": "linkedin.com/in/harshitclub",
      "twitter": "@harshitclub",
    },
    "website": "https://harshitclub.com",
    "professional": "Developer & Consultant",
  };
  print(user);
  var jsonFormattedData = jsonEncode(user);
  print("-------json below-----------");
  print(jsonFormattedData);
  print("-------dart decode----------");
  var dartObjectNow = jsonDecode(jsonFormattedData);
  print(dartObjectNow);
}
