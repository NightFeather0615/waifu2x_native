import "dart:async";

import "package:flutter/material.dart";

import "package:path_provider/path_provider.dart";

import "package:waifu2x_native/native/api/utils.dart";
import "package:waifu2x_native/native/frb_generated.dart";
import "package:waifu2x_native/widget/tiled_renderer.dart";
import "package:waifu2x_native/widget/side_panel.dart";


Future<void> main() async {
  await RustLib.init();

  await setFolderPath(
    cacheFolderPath: (await getApplicationCacheDirectory()).path,
    documentsFolderPath: (await getApplicationDocumentsDirectory()).path,
    downloadsFolderPath: (await getDownloadsDirectory())!.path,
    supportFolderPath: (await getApplicationSupportDirectory()).path,
    temporaryFolderPath: (await getTemporaryDirectory()).path
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TiledRenderer> _renderers = [];
  int _currentRenderer = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Row(
          children: [
            _renderers.isEmpty ? const Flexible(
              child: Center(
                child: Text(
                  "(・∀・)  Press \"Add Task\" to start a new task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ) : Flexible(
              child: IndexedStack(
                alignment: AlignmentDirectional.center,
                sizing: StackFit.expand,
                index: _currentRenderer,
                children: _renderers,
              ),
            ),
            SidePanel(
              onTaskSelect: (index) {
                setState(() {
                  _currentRenderer = index;
                });
              },
              onTaskAdd: (renderer) {
                setState(() {
                  _renderers.add(renderer);
                });
              }
            )
          ],
        )
      ),
    );
  }
}
