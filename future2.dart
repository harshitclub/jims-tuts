import "dart:async";

void main() async {
  print("Application Started...");
  print("Fetching User Data...");
  // Map user = await userData();
  try {
    await userData().then((user) {
      user.forEach((userKey, userValue) {
        if (userKey == "social" && userValue is Map) {
          print("Social Information");
          userValue.forEach((socialKey, socialValue) {
            print("    $socialKey: $socialValue");
          });
        } else {
          print("$userKey: $userValue");
        }
      });
    });
    print("All Ok!");
  } catch (e) {
    print(e);
    print("Not ok!");
  } finally {
    print("Application Ends...");
  }
}

Future<Map> userData() async {
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
  await Future.delayed(Duration(seconds: 2));
  throw Exception("This is the error");
  return user;
}
