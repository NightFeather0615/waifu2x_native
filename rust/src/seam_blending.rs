use ndarray::Array3;

use crate::inference::{Inference, Pad};


type DimIx3 = (usize, usize, usize);


const BLEND_SIZE: i64 = 16;


#[derive(Debug, Default, Clone, Copy)]
pub(crate) struct SeamBlendingConfig {
  pub input_tile_step: usize,
  pub output_tile_step: usize,
  pub y_blocks: usize,
  pub x_blocks: usize,
  buffer_height: usize,
  buffer_width: usize,
  pub pad: Pad
}

impl SeamBlendingConfig {
  fn new(input_dim: DimIx3, scale: usize, offset: usize, tile_size: usize) -> Self {
    let input_height = input_dim.1;
    let input_width = input_dim.2;

    let input_offset = (offset as f64 / scale as f64).ceil() as usize;
    let input_blend_size = (BLEND_SIZE as f64 / scale as f64).ceil() as usize;
    let input_tile_step = tile_size - (input_offset * 2 + input_blend_size);

    let mut y_blocks = 0;
    let mut x_blocks = 0;
    let mut output_height = 0;
    let mut output_width = 0;

    while output_height < input_height + input_offset * 2 {
      output_height = y_blocks * input_tile_step + tile_size;
      y_blocks += 1;
    }

    while output_width < input_width + input_offset * 2 {
      output_width = x_blocks * input_tile_step + tile_size;
      x_blocks += 1;
    }

    SeamBlendingConfig {
      input_tile_step,
      output_tile_step: input_tile_step * scale,
      y_blocks,
      x_blocks,
      buffer_height: (output_height * scale) as usize,
      buffer_width: (output_width * scale) as usize,
      pad: (
        input_offset,
        output_width - (input_width + input_offset),
        input_offset,
        output_height - (input_height + input_offset)
      )
    }
  }
}

pub(crate) struct SeamBlending {
  pub config: SeamBlendingConfig,
  pub buffer: Array3<f32>,
  weights: Array3<f32>,
  blend_filter: Array3<f32>
}

impl SeamBlending {
  pub(crate) fn new(input_dim: DimIx3, scale: usize, offset: usize, tile_size: usize) -> Self {
    let config = SeamBlendingConfig::new(input_dim, scale, offset, tile_size);
    let blend_filter = Inference::create_seam_blending_filter(scale, offset, tile_size);

    Self {
      config,
      buffer: Array3::zeros((3, config.buffer_height, config.buffer_width)),
      weights: Array3::zeros((3, config.buffer_height, config.buffer_width)),
      blend_filter
    }
  }

  pub(crate) fn update(self: &mut Self, data: Array3<f32>, tile_x: usize, tile_y: usize) {
    let (color, height, weight) = self.blend_filter.dim();
    let buffer_y = self.config.output_tile_step * tile_y;
    let buffer_x = self.config.output_tile_step * tile_x;

    let mut old_weight;
    let mut next_weight;
    let mut new_weight;

    for c in 0 .. color {
      for y in 0 .. height {
        for x in 0 .. weight {
          let tile_index = (c, y, x);
          let buffer_index = (c, y + buffer_y, x + buffer_x);
          old_weight = self.weights[buffer_index];
          next_weight = old_weight + self.blend_filter[tile_index];
          old_weight = old_weight / next_weight;
          new_weight = 1.0 - old_weight;
          self.buffer[buffer_index] = self.buffer[buffer_index] * old_weight + data[tile_index] * new_weight;
          self.weights[buffer_index] += self.blend_filter[tile_index];
        }
      }
    }
  }
}
