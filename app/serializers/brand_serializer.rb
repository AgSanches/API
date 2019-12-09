class BrandSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :getImagePath

  def getImagePath
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
