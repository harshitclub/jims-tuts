import 'dart:async';

void main() async {
  print("Application Start...");
  try {
    Map userData = await fetchData();
    userData.forEach((userKey, userValue) {
      if (userKey == "social" && userValue is Map) {
        print("Social Information:");
        userValue.forEach((socialKey, socialValue) {
          print("    $socialKey: $socialValue"); // Indent social info
        });
      } else {
        print("$userKey: $userValue");
      }
    });
  } catch (e) {
    print("An error occurred: $e");
  } finally {
    print("All Processes Closed Now!");
  }
}

Future<Map> fetchData() async {
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
  print("Rendering Data...");
  // Simulate an error for demonstration purposes (uncomment to test)
  // throw Exception("Failed to fetch data!");
  await Future.delayed(Duration(seconds: 2));
  print("Data is Ready!");
  return user;
}
