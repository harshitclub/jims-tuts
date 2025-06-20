import 'dart:convert'; // For json.decode
import 'package:http/http.dart' as http; // For making HTTP requests

void main() async {
  print("Making API call to JSONPlaceholder...");
  await fetchPosts();
}

Future<void> fetchPosts() async {
  final String apiUrl =
      'https://jsonplaceholder.typicode.com/posts'; // Endpoint for posts

  try {
    // Make the GET request
    final response = await http.get(Uri.parse(apiUrl));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response body
      // The response.body is a String, so we need to decode it.
      // json.decode returns a dynamic type, which will usually be a List or Map.
      final List<dynamic> posts = json.decode(response.body);

      print("Successfully fetched posts!");
      print("Total posts: ${posts.length}");

      // Print the first 3 posts as an example
      if (posts.isNotEmpty) {
        print("\n--- First 3 Posts ---");
        for (int i = 0; i < (posts.length > 3 ? 3 : posts.length); i++) {
          print("Post ${i + 1}:");
          print("  ID: ${posts[i]['id']}");
          print("  Title: ${posts[i]['title']}");
          print(
            "  Body: ${posts[i]['body'].substring(0, 50)}...",
          ); // Print first 50 chars of body
          print("--------------------");
        }
      }
    } else {
      // If the server returns an error response
      print("Failed to load posts. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    // Catch any network errors or other exceptions
    print("An error occurred during the API call: $e");
  }
}
