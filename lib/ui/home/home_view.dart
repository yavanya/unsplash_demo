import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unsplash_demo/domain/state/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return model.isBusy
            ? Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                    title: SizedBox(
                      width: 30,
                      child: Image.asset('assets/images/logo.png',
                          fit: BoxFit.fitWidth),
                    ),
                    centerTitle: true),
                body: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 1,
                  ),
                ))
            : Scaffold(
                drawer: DrawerView(model),
                backgroundColor: Colors.black,
                appBar: AppBar(
                    title: SizedBox(
                        width: 30,
                        child: Image.asset('assets/images/logo.png',
                            fit: BoxFit.fitWidth)),
                    centerTitle: true),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => model.futureToRun(),
                  child: Icon(Icons.refresh_outlined),
                ),
                body: _gridViewWidget(context, model),
              );
      },
    );
  }
}

Widget _gridViewWidget(BuildContext contex, HomeViewModel model) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemCount: model.tiles.tiles.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BigPic(model.tiles.tiles[index].imageUrl);
            }),
          );
        },
        child: Image.network(
          model.tiles.tiles[index].thumbUrl,
          fit: BoxFit.cover,
        ),
      );
    },
  );
}

class BigPic extends StatelessWidget {
  final String imageUrl;
  BigPic(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
            child: Image.network(imageUrl, fit: BoxFit.fitWidth)),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  DrawerView(this.model);
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.black,
        width: _size.width * 0.6,
        height: _size.height,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50, child: Image.asset('assets/images/logo.png')),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Image Count: ${model.count}',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.white54,
                divisions: 30,
                value: model.count.toDouble(),
                min: 20,
                max: 30,
                onChanged: (i) => model.count = i.toInt()),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
