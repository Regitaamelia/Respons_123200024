import 'package:responsi_123200024/model/list_model.dart';
import 'package:responsi_123200024/view/detail_page.dart';
import '../controller/data_source.dart';
import 'package:flutter/material.dart';

class PageListData extends StatefulWidget {
  final String text;
  const PageListData({Key? key, required this.text}) : super(key: key);
  @override
  State<PageListData> createState() => _PageListDataState();
}

class _PageListDataState extends State<PageListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            Text(
              'Valorant Agents',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: DataSource.instance.loadData(widget.text),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          } else if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            HomeData dataModel = HomeData.fromJson(snapshot.data);
            if (dataModel.data == "False") {
              return kosong();
            } else {
              return _buildSuccessSection(dataModel);
            }
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget kosong() {
    return Center(
      child: Text("Data Kosong"),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(HomeData data) {
    return ListView.builder(
      itemCount: data.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(data.data![index]);
      },
    );
  }

  Widget _buildItemUsers(Data listData) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage(x: null,))),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listData.displayName!,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(listData.description!)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
