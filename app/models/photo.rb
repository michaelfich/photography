# rubocop:disable MethodLength, Metrics/AbcSize, ClassLength

class Photo
  attr_accessor \
    :id,
    :user_id,
    :name,
    :description,
    :camera,
    :lens,
    :focal_strength,
    :iso,
    :shutter_speed,
    :aperature,
    :times_viewed,
    :rating,
    :rating,
    :status,
    :created_at,
    :category,
    :category,
    :location,
    :longitude,
    :taken_at,
    :hi_res_uploaded,
    :for_sale,
    :width,
    :height,
    :votes_count,
    :favorites_count,
    :comments_count,
    :nsfw,
    :sales_count,
    :for_sale_date,
    :highest_rating,
    :highest_rating_date,
    :license_type,
    :converted,
    :collections_count,
    :crop_version,
    :privacy,
    :profile,
    :image_url,
    :images,
    :url,
    :positive_votes_count,
    :converted_bits,
    :watermark,
    :image_format,
    :user,
    :licensing_requested,
    :licensing_suggested,
    :is_free_photo

  def initialize(params)
    @id = params['id']
    @user_id = params['user_id']
    @name = params['name']
    @description = params['description']
    @camera = params['camera']
    @lens = params['lens']
    @focal_strength = params['focal_strength']
    @iso = params['iso']
    @shutter_speed = params['shutter_speed']
    @aperature = params['aperature']
    @times_viewed = params['times_viewed']
    @rating = params['rating']
    @rating = params['rating']
    @status = params['status']
    @created_at = params['created_at']
    @category = params['category']
    @category = params['category']
    @location = params['location']
    @longitude = params['longitude']
    @taken_at = params['taken_at']
    @hi_res_uploaded = params['hi_res_uploaded']
    @for_sale = params['for_sale']
    @width = params['width']
    @height = params['height']
    @votes_count = params['votes_count']
    @favorites_count = params['favorites_count']
    @comments_count = params['comments_count']
    @nsfw = params['nsfw']
    @sales_count = params['sales_count']
    @for_sale_date = params['for_sale_date']
    @highest_rating = params['highest_rating']
    @highest_rating_date = params['highest_rating_date']
    @license_type = params['license_type']
    @converted = params['converted']
    @collections_count = params['collections_count']
    @crop_version = params['crop_version']
    @privacy = params['privacy']
    @profile = params['profile']
    @image_url = params['image_url']
    @images = params['images'].map do
      {
        size: params['size'],
        url: params['url'],
        https_url: params['https_url'],
        format: params['format']
      }
    end
    @url = params['url']
    @positive_votes_count = params['positive_votes_count']
    @converted_bits = params['converted_bits']
    @watermark = params['watermark']
    @image_format = params['image_format']
    @user = {
      id: params['user']['id'],
      username: params['user']['username'],
      firstname: params['user']['firstname'],
      lastname: params['user']['lastname'],
      city: params['user']['city'],
      country: params['user']['country'],
      usertype: params['user']['usertype'],
      fullname: params['user']['fullname'],
      userpic_url: params['user']['userpic_url'],
      userpic_https_url: params['user']['userpic_https_url'],
      cover_url: params['user']['cover_url'],
      upgrade_status: params['user']['upgrade_status'],
      store_on: params['user']['store_on'],
      affection: params['user']['affection'],
      avatars: {
        default: params['user']['avatars']['default']['https'],
        large: params['user']['avatars']['large']['https'],
        small: params['user']['avatars']['small']['https'],
        tiny: params['user']['avatars']['tiny']['https']
      }
    }
    @licensing_requested = params['licensing_requested']
    @licensing_suggested = params['licensing_suggested']
    @is_free_phot = params['is_free_phot']
  end
end
