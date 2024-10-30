enum PadType {
  defaultPad,
  replicationPad,
  reflectionPad;

  int toInt() {
    switch (this) {
      case PadType.defaultPad:
        return 0;
      case PadType.replicationPad:
        return 1;
      case PadType.reflectionPad:
        return 2;
    }
  }
}

class ModelConfig {
  final String arch;
  final String domain;
  final List<int> scale;
  final bool colorStability;
  final PadType padding;
  final int Function(int scale) calcOffset;
  final int Function(int tileSize, int scale, int offset) calcTileSize;

  ModelConfig({
    required this.arch,
    required this.domain,
    required this.scale,
    required this.colorStability,
    required this.padding,
    required this.calcOffset,
    required this.calcTileSize
  });

  static final denoiseLevelOption = {
    -1: "None",
    0: "Low",
    1: "Medium",
    2: "High",
    3: "Highest"
  };

  static final tileSizeOption = [
    16,
    64,
    112,
    160,
    256,
    400,
    640,
    880,
    1024,
    2032
  ];

  static final ttaLevelOption = [
    0,
    2,
    4
  ];

  static final modelOption = [
    ModelConfig(
      arch: "swin_unet",
      domain: "art",
      scale: [1, 2, 4],
      colorStability: true,
      padding: PadType.replicationPad,
      calcOffset: (scale) => scale * 8,
      calcTileSize: (tileSize, scale, offset) {
        while (true) {
          if ((tileSize - 16) % 12 == 0 && (tileSize - 16) % 16 == 0) {
            break;
          }
          tileSize += 1;
        }
        return tileSize;
      },
    ),
    ModelConfig(
      arch: "swin_unet",
      domain: "art_scan",
      scale: [1, 2, 4],
      colorStability: true,
      padding: PadType.replicationPad,
      calcOffset: (scale) => scale * 8,
      calcTileSize: (tileSize, scale, offset) {
        while (true) {
          if ((tileSize - 16) % 12 == 0 && (tileSize - 16) % 16 == 0) {
            break;
          }
          tileSize += 1;
        }
        return tileSize;
      },
    ),
    ModelConfig(
      arch: "swin_unet",
      domain: "photo",
      scale: [1, 2, 4],
      colorStability: true,
      padding: PadType.reflectionPad,
      calcOffset: (scale) => scale * 8,
      calcTileSize: (tileSize, scale, offset) {
        while (true) {
          if ((tileSize - 16) % 12 == 0 && (tileSize - 16) % 16 == 0) {
            break;
          }
          tileSize += 1;
        }
        return tileSize;
      },
    ),
    ModelConfig(
      arch: "cunet",
      domain: "art",
      scale: [1, 2],
      colorStability: true,
      padding: PadType.replicationPad,
      calcOffset: (scale) => 20 + scale * 8,
      calcTileSize: (tileSize, scale, offset) {
        final adj = scale == 1 ? 16 : 32;
        tileSize = (((tileSize * scale + offset * 2) - adj) / scale).round();
        tileSize -= tileSize % 4;
        return tileSize;
      },
    ),
  ];
}
