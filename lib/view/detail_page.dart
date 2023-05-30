import 'package:flutter/material.dart';
import 'package:responsi_123200024/model/list_model.dart';

class DetailPage extends StatelessWidget {
  final HomeData x;

  const DetailPage({required this.x, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(x.data!.posts![0].title!),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                x.data!.posts![0].getFormattedDate(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              x.data!.posts![0].thumbnail!,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                x.data!.posts![0].title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(x.data!.posts![0].description!),
            ),
          ],
        ),
      ),
    );
  }
}