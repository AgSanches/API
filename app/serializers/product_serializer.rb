class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def getBrand
    Brand.find(object.brand_id).name
  end

  def getProductPresentationPhotoPath
    rails_blob_path(object.product_presentation, only_path: true) if object.product_presentation.attached?
  end

  def getSliderPhotoPath
    rails_blob_path(object.slider_photo, only_path: true) if object.slider_photo.attached?
  end

  def getProductPhotoPath
    photos = []
    object.product_photos.each do |photo|
      photos <<  rails_blob_path(photo, only_path: true)
    end
    return photos
  end

  def getSizes
    object.sizes.map do |size|
      ProductSerializer.new(size)
    end
  end

  def getSizes
    self.object.sizes.map do |size|
      size.number
    end
  end


  attributes :id, :name, :price, :discount, :isSale,
             :description, :getBrand, :getProductPresentationPhotoPath,
             :getSliderPhotoPath, :getProductPhotoPath, :getSizes


end
