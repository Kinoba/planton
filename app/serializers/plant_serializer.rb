class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :pictures do |object|
    object.pictures.map { |img| rails_blob_path(img, disposition: "attachment", only_path: true) }
  end
  
  # has_many :pictures, polymorphic: true, serializer: Api::V1::PictureSerializer
end
