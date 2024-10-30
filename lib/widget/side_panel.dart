import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:waifu2x_native/core/model_config.dart";
import "package:waifu2x_native/core/task_pool.dart";
import "package:waifu2x_native/native/api/api.dart";
import "package:waifu2x_native/widget/select_file_dialog.dart";
import "package:waifu2x_native/widget/tiled_renderer.dart";

class SidePanel extends StatefulWidget {
  const SidePanel({
    super.key,
    required this.onTaskSelect,
    required this.onTaskAdd
  });

  final void Function(int index) onTaskSelect;
  final void Function(TiledRenderer renderer) onTaskAdd;

  @override
  State<StatefulWidget> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 340,
        child: Column(
          children: [
            Expanded(
              child: ListenableBuilder(
                listenable: InferenceTaskPool.instance,
                builder: (BuildContext context, Widget? child) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: InferenceTaskPool.instance.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final task = InferenceTaskPool.instance.tasks.values.elementAtOrNull(index);

                      if (task == null) return null;

                      double? progress = 0.0;

                      switch (task.taskState) {
                        case TaskState_Waiting(): {}
                        case TaskState_LoadImage(): {
                          progress = null;
                        }
                        case TaskState_Pad(): {
                          progress = null;
                        }
                        case TaskState_LoadModel(): {
                          progress = null;
                        }
                        case TaskState_Inference(): {
                          progress = (task.taskState as TaskState_Inference).progress / (task.taskState as TaskState_Inference).total;
                        }
                        case TaskState_SaveImage(): {
                          progress = 1.0;
                        }
                        case TaskState_Done():{
                          progress = 1.0;
                        }
                      }

                      return InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          widget.onTaskSelect(index);
                        },
                        child: Card.filled(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.inputFilename,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                            ),
                                          ),
                                          Text(
                                            "${task.arch} / ${task.domain}",
                                            style: const TextStyle(
                                              fontSize: 16
                                            ),
                                          ),
                                          Text(
                                            "Scale ${task.scale}x",
                                            style: const TextStyle(
                                              fontSize: 16
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "#${task.id}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Theme.of(context).colorScheme.secondary
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                LinearProgressIndicator(value: progress,)
                              ],
                            ),
                          ),
                        )
                      );
                    }
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(
                  Size(340, 56)
                ),
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12)
                    )
                  )
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.secondaryContainer
                )
              ),
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) {
                    return const SelectFileDialog();
                  }
                );

                if (result != null) {
                  widget.onTaskAdd(result);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 30,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                      child: Text(
                        "Add Task",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(
                  Size(340, 56)
                ),
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder()
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.secondaryContainer
                )
              ),
              onPressed: () {
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings_rounded,
                      size: 30,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 2
                      ),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            )
          ],
        ),
      );
  }
}
