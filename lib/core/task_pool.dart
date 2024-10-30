import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:waifu2x_native/core/model_config.dart";
import "package:waifu2x_native/native/api/api.dart";


class InferenceTask {
  final int id;
  final String inputFilename;
  final String inputPath;
  final String outputPath;
  final int texturePtr;
  final String arch;
  final String domain;
  final int scale;
  final int denoise;
  final int ttaLevel;
  final bool colorStability;
  final PadType padding;
  final int tileSize;
  final int offset;
  final void Function(TaskState) onState;
  ConnectionState connectionState = ConnectionState.waiting;
  TaskState taskState = const TaskState.waiting();

  InferenceTask({
    required this.id,
    required this.inputFilename,
    required this.inputPath,
    required this.outputPath,
    required this.texturePtr,
    required this.arch,
    required this.domain,
    required this.scale,
    required this.denoise,
    required this.ttaLevel,
    required this.colorStability,
    required this.padding,
    required this.tileSize,
    required this.offset,
    required this.onState
  });
}

class InferenceTaskPool with ChangeNotifier {
  InferenceTaskPool._();

  static InferenceTaskPool? _instance;

  final Map<int, InferenceTask> tasks = {};
  int lastTaskId = -1;

  static InferenceTaskPool get instance {
    _instance ??= InferenceTaskPool._();
    return _instance!;
  }

  void addTask(InferenceTask task) {
    tasks.putIfAbsent(task.id, () => task);
    notifyListeners();
    _runTasks();
  }

  Future<void> _runTasks() async {
    if (tasks.values.any((t) => t.connectionState == ConnectionState.active)) return;

    tasks.values.toList().sort((a, b) => a.id.compareTo(b.id));
    final awaitingTasks = tasks.values.where(
      (t) => t.connectionState == ConnectionState.waiting
    ).toList();

    if (awaitingTasks.isEmpty) return;

    final task = awaitingTasks[0];

    tasks[task.id]?.connectionState = ConnectionState.active;

    notifyListeners();

    await inferImage(
      inputFilename: task.inputFilename,
      inputPath: task.inputPath,
      outputPath: task.outputPath,
      texturePtr: BigInt.from(task.texturePtr),
      arch: task.arch,
      domain: task.domain,
      scale: task.scale,
      denoise: task.denoise,
      ttaLevel: task.ttaLevel,
      colorStability: task.colorStability,
      padding: task.padding.toInt(),
      tileSize: task.tileSize,
      offset: task.offset,
      onState: (state) {
        tasks[task.id]?.taskState = state;
        task.onState(state);
        notifyListeners();
      }
    );

    tasks[task.id]?.connectionState = ConnectionState.done;

    notifyListeners();

    _runTasks();
  }
}
