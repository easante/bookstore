# encoding: utf-8

class BookCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :dropbox

  version :thumb do
    process :resize_to_fill => [75, 75]
  end

  # version :normal do
  #   process :resize_to_fill => [350, 350]
  # end

  process :resize_to_fill => [300, 300]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
