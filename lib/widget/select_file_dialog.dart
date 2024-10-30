import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import "package:waifu2x_native/core/model_config.dart";
import "package:waifu2x_native/widget/tiled_renderer.dart";

class SelectFileDialog extends StatefulWidget {
  const SelectFileDialog({super.key});

  @override
  State<StatefulWidget> createState() => _SelectFileDialogState();
}

class _SelectFileDialogState extends State<SelectFileDialog> {
  final _filenameController = TextEditingController();
  final _inputPathController = TextEditingController();
  final _outputPathController = TextEditingController();

  ModelConfig? _model;
  int? _scale = 2;
  int? _denoise = 1;
  int _ttaLevel = 2;
  int _tileSize = 256;

  Future<void> _selectInputFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Select Image",
      initialDirectory: (await getDownloadsDirectory())?.path,
      lockParentWindow: true,
      type: FileType.image
    );

    if (result == null || result.files.isEmpty) return;

    final splittedPath = result.files.first.path!.replaceAll("\\", "/").split("/");

    _filenameController.text = splittedPath.removeLast();
    _inputPathController.text = splittedPath.join("/");

    if (_outputPathController.text.isEmpty) {
      _outputPathController.text = splittedPath.join("/");
    }

    if (mounted) setState(() {});
  }

  Future<void> _selectOutputPath() async {
    String? result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: "Select Output Directory",
      initialDirectory: (await getDownloadsDirectory())?.path,
      lockParentWindow: true
    );

    if (result == null) return;

    _outputPathController.text = result.replaceAll("\\", "/");

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 500,
            child: TextField(
              controller: _filenameController,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input File"
              ),
              onTap: _selectInputFile,
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: 500,
            child: TextField(
              controller: _inputPathController,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input Directory"
              ),
            ),
          ),
          const SizedBox(height: 16,),
          SizedBox(
            width: 500,
            child: TextField(
              controller: _outputPathController,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Output Directory"
              ),
              onTap: _selectOutputPath,
            ),
          ),
          const SizedBox(height: 16,),
          DropdownMenu(
            label: const Text("Model"),
            width: 500,
            requestFocusOnTap: false,
            onSelected: (value) {
              if (value == null) return;

              setState(() {
                _model = ModelConfig.modelOption[value];
              });
            },
            dropdownMenuEntries: ModelConfig.modelOption.asMap().map(
              (index, model) {
                return MapEntry(
                  index,
                  DropdownMenuEntry(
                    value: index,
                    label: "${model.arch} / ${model.domain}"
                  )
                );
              }
            ).values.toList(),
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu(
                key: UniqueKey(),
                label: const Text("Scale"),
                width: 242,
                requestFocusOnTap: false,
                initialSelection: (_model == null) ? null : _scale,
                onSelected: (value) {
                  if (value == null) return;
                  
                  _scale = value;
                },
                dropdownMenuEntries: (_model == null) ? [
                  const DropdownMenuEntry(value: null, label: "N/A")
                ] : _model!.scale.map(
                  (e) => DropdownMenuEntry(value: e, label: "${e}x")
                ).toList(),
              ),
              DropdownMenu(
                label: const Text("DeNoise"),
                width: 242,
                requestFocusOnTap: false,
                initialSelection: _denoise,
                onSelected: (value) {
                  if (value == null) return;
                  
                  _denoise = value;
                },
                dropdownMenuEntries: ModelConfig.denoiseLevelOption.map(
                  (level, label) => MapEntry(
                    level,
                    DropdownMenuEntry(
                      value: level,
                      label: label
                    )
                  )
                ).values.toList(),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu(
                label: const Text("TTA"),
                width: 242,
                requestFocusOnTap: false,
                initialSelection: _ttaLevel,
                onSelected: (value) {
                  if (value == null) return;

                  _ttaLevel = value;
                },
                dropdownMenuEntries: ModelConfig.ttaLevelOption.map(
                  (e) => DropdownMenuEntry(value: e, label: "$e")
                ).toList(),
              ),
              DropdownMenu(
                label: const Text("Tile Size"),
                width: 242,
                requestFocusOnTap: false,
                initialSelection: _tileSize,
                onSelected: (value) {
                  if (value == null) return;
                  
                  _tileSize = value;
                },
                dropdownMenuEntries: ModelConfig.tileSizeOption.map(
                  (e) => DropdownMenuEntry(value: e, label: "$e")
                ).toList(),
              ),
            ],
          )
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel")
        ),
        FilledButton(
          onPressed: (
            _filenameController.text.isEmpty ||
            _inputPathController.text.isEmpty ||
            _outputPathController.text.isEmpty ||
            _model == null || _scale == null || _denoise == null 
          ) ? null : () {
            Navigator.of(context).pop(
              TiledRenderer(
                inputFilename: _filenameController.text,
                inputPath: _inputPathController.text,
                outputPath: _outputPathController.text,
                modelConfig: _model!,
                scale: _scale!,
                denoise: _denoise!,
                ttaLevel: _ttaLevel,
                tileSize: _tileSize
              )
            );
          },
          child: const Text("Add")
        ),
      ],
    );
  }
}
