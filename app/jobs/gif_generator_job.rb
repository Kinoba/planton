# frozen_string_literal: true

require 'benchmark'

# Generate gifs based on plant images
class GifGeneratorJob < ApplicationJob
  queue_as :default

  OUTPUT_PATH = '/Users/greg/Developement/opensource/planton/tmp/gifs'

  def perform(*args)
    Rails.logger.info 'GifGeneratorJob started'
    time = Benchmark.realtime { generate_gifs }
    Rails.logger.info "GifGeneratorJob done in #{time} seconds"
  end

  private

  def generate_gifs
    cmd_palette = generate_palette
    cmd_temp_movie = generate_temp_movie
    cmd_gif = generate_gif

    Rails.logger.info "PALETTE GENERATION: #{cmd_palette}"
    Rails.logger.info "TEMP MOVIE GENERATION: #{cmd_temp_movie}"
    Rails.logger.info "GIF GENERATION: #{cmd_gif}"
  end

  def generate_palette
    system("ffmpeg -y -f image2 -i \"/Users/greg/Downloads/september-2019/0%d-September.jpg\" -vf scale=900:-1:sws_dither=ed,palettegen \"#{OUTPUT_PATH}/COLOR_PALETTE.png\"")
  end

  def generate_temp_movie
    system("ffmpeg -y -f image2 -framerate 1.2 -i \"/Users/greg/Downloads/september-2019/0%d-September.jpg\" \"#{OUTPUT_PATH}/COLOR_PALETTE.mp4\"")
  end

  def generate_gif
    system("ffmpeg -y -i \"#{OUTPUT_PATH}/COLOR_PALETTE.mp4\" -i \"#{OUTPUT_PATH}/COLOR_PALETTE.png\" -filter_complex \"fps=1.2,scale=500:-1:flags=lanczos[x];[x][1:v]paletteuse\" \"#{OUTPUT_PATH}/COLOR_PALETTE.gif\"")
  end
end
