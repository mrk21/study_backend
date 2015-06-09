require 'bundler'
require 'fileutils'
Bundler.require

def polaroid(path)
  name = File.basename(path,'.*')
  
  image = Magick::ImageList.new(path).first
  base = Magick::Image.new(image.columns, image.rows)
  base.background_color = '#FFFFFF'
  image = base.composite(image, Magick::CenterGravity, Magick::OverCompositeOp)
  base.destroy!
  
  new_image = image.polaroid
  new_image.write("tmp/#{name}_polaroid.png")
  image.destroy!
  new_image.destroy!
end

FileUtils.rm_rf('tmp')
FileUtils.mkdir('tmp')
polaroid("images/jpeg.jpg")
polaroid("images/png_with_alpha.png")
