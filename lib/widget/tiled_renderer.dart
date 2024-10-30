import "package:flutter/material.dart";

import "package:texture_rgba_renderer/texture_rgba_renderer.dart";

import "package:waifu2x_native/core/task_pool.dart";
import "package:waifu2x_native/core/model_config.dart";
import "package:waifu2x_native/native/api/api.dart";
import "package:waifu2x_native/native/api/utils.dart";


class TiledRenderer extends StatefulWidget {
  const TiledRenderer({
    super.key,
    required this.inputFilename,
    required this.inputPath,
    required this.outputPath,
    required this.modelConfig,
    required this.scale,
    required this.denoise,
    required this.ttaLevel,
    required this.tileSize
  });

  final String inputFilename;
  final String inputPath;
  final String outputPath;
  final ModelConfig modelConfig;
  final int scale;
  final int denoise;
  final int ttaLevel;
  final int tileSize;
  
  @override
  State<StatefulWidget> createState() => _TiledRendererState();
}

class _TiledRendererState extends State<TiledRenderer> {
  late Future<int> _initTaskFuture;
  late Future<(int, int)> _getImageSizeFuture;
  late Future<String> _getCurrentDeviceFuture;

  double? _progress = 0.0;
  String _text = "(・∀・)  Waiting...";

  Future<int> initTask() async {
    final taskId = InferenceTaskPool.instance.lastTaskId + 1;
    InferenceTaskPool.instance.lastTaskId += 1;

    final textureRenderer = TextureRgbaRenderer();

    await textureRenderer.closeTexture(taskId);

    final textureId = await textureRenderer.createTexture(taskId);

    final offset = widget.modelConfig.calcOffset(widget.scale);

    InferenceTaskPool.instance.addTask(
      InferenceTask(
        id: taskId,
        inputFilename: widget.inputFilename,
        inputPath: widget.inputPath,
        outputPath: widget.outputPath,
        texturePtr: await textureRenderer.getTexturePtr(taskId),
        arch: widget.modelConfig.arch,
        domain: widget.modelConfig.domain,
        scale: widget.scale,
        denoise: widget.denoise,
        ttaLevel: widget.ttaLevel,
        colorStability: widget.modelConfig.colorStability,
        padding: widget.modelConfig.padding,
        tileSize: widget.modelConfig.calcTileSize(
          widget.tileSize,
          widget.scale,
          offset
        ),
        offset: offset,
        onState: (state) {
          if (mounted) {
            switch (state) {
              case TaskState_Waiting(): {
                _text = "(・∀・)  Waiting...";
              }
              case TaskState_LoadImage(): {
                _text = "(・∀・)φ  Loading image...";
                _progress = null;
              }
              case TaskState_Pad(): {
                _text = "(・∀・)φ  Padding image...";
                _progress = null;
              }
              case TaskState_LoadModel(): {
                _text = "(・∀・)φ  Loading model...";
                _progress = null;
              }
              case TaskState_Inference(): {
                final face = "( ・∀・)${(state.progress % 2 == 0) ? "φ   " : "   φ"}";
                _text = "$face  ( ${state.progress} / ${state.total} )";
                _progress = state.progress / state.total;
              }
              case TaskState_SaveImage(): {
                _text = "( ・∀・)つ  Saving image...";
                _progress = 1.0;
              }
              case TaskState_Done(): {
                _text = "(・∀・)  Task done";
                _progress = 1.0;
              }
            }
            setState(() {});
          }
        },
      )
    );

    return textureId;
  }

  @override
  void initState() {
    _initTaskFuture = initTask();
    _getImageSizeFuture = getImageSize(
      imagePath: "${widget.inputPath}/${widget.inputFilename}"
    );
    _getCurrentDeviceFuture = getCurrentDevice();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initTaskFuture,
      builder: (context, textureId) {
        if (textureId.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        }
        
        return FutureBuilder(
          future: _getImageSizeFuture,
          builder: (context, imageSize) {
            if (imageSize.connectionState != ConnectionState.done) {
              return const SizedBox.shrink();
            }

            return FutureBuilder(
              future: _getCurrentDeviceFuture,
              builder: (context, currentDevice) {
                if (currentDevice.connectionState != ConnectionState.done) {
                  return const SizedBox.shrink();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox.shrink(),
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: imageSize.data!.$1 / imageSize.data!.$2,
                        child: Texture(
                          textureId: textureId.data!,
                          filterQuality: FilterQuality.low,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(width: 60,),
                              Flexible(
                                child: Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Model "),
                                    TextSpan(
                                      text: "${widget.modelConfig.arch}/${widget.modelConfig.domain}",
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(text: " | Scale "),
                                    TextSpan(
                                      text: "${widget.scale}x",
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(text: " | DeNoise Lvl. "),
                                    TextSpan(
                                      text: "${widget.denoise}",
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(text: " | TTA Lvl. "),
                                    TextSpan(
                                      text: "${widget.ttaLevel}",
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(text: " | Tile Size "),
                                    TextSpan(
                                      text: "${widget.tileSize}",
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(text: " | Device "),
                                    TextSpan(
                                      text: currentDevice.data,
                                      style: const TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                  ]
                                )
                              ),
                              ),
                            ],
                          )
                        ),
                        LinearProgressIndicator(
                          value: _progress,
                        ),
                      ],
                    )
                  ],
                );
              }
            );
          },
        );
      }
    );
  }
}
