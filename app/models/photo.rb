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

  def initialize(params = {})
    @id = params.dig('id')
    @user_id = params.dig('user_id')
    @name = params.dig('name')
    @description = params.dig('description')
    @camera = params.dig('camera')
    @lens = params.dig('lens')
    @focal_strength = params.dig('focal_strength')
    @iso = params.dig('iso')
    @shutter_speed = params.dig('shutter_speed')
    @aperature = params.dig('aperature')
    @times_viewed = params.dig('times_viewed')
    @rating = params.dig('rating')
    @rating = params.dig('rating')
    @status = params.dig('status')
    @created_at = params.dig('created_at')
    @category = params.dig('category')
    @category = params.dig('category')
    @location = params.dig('location')
    @longitude = params.dig('longitude')
    @taken_at = params.dig('taken_at')
    @hi_res_uploaded = params.dig('hi_res_uploaded')
    @for_sale = params.dig('for_sale')
    @width = params.dig('width')
    @height = params.dig('height')
    @votes_count = params.dig('votes_count')
    @favorites_count = params.dig('favorites_count')
    @comments_count = params.dig('comments_count')
    @nsfw = params.dig('nsfw')
    @sales_count = params.dig('sales_count')
    @for_sale_date = params.dig('for_sale_date')
    @highest_rating = params.dig('highest_rating')
    @highest_rating_date = params.dig('highest_rating_date')
    @license_type = params.dig('license_type')
    @converted = params.dig('converted')
    @collections_count = params.dig('collections_count')
    @crop_version = params.dig('crop_version')
    @privacy = params.dig('privacy')
    @profile = params.dig('profile')
    @image_url = params.dig('image_url')
    if params.dig('images').respond_to? :each
      @images = params.dig('images').map do
        {
          size: params.dig('size'),
          url: params.dig('url'),
          https_url: params.dig('https_url'),
          format: params.dig('format')
        }
      end
    end
    @url = params.dig('url')
    @positive_votes_count = params.dig('positive_votes_count')
    @converted_bits = params.dig('converted_bits')
    @watermark = params.dig('watermark')
    @image_format = params.dig('image_format')
    @user = {
      id: params.dig('user', 'id'),
      username: params.dig('user', 'username'),
      firstname: params.dig('user', 'firstname'),
      lastname: params.dig('user, lastname'),
      city: params.dig('user, city'),
      country: params.dig('user', 'country'),
      usertype: params.dig('user', 'usertype'),
      fullname: params.dig('user', 'fullname'),
      userpic_url: params.dig('user', 'userpic_url'),
      userpic_https_url: params.dig('user', 'userpic_https_url'),
      cover_url: params.dig('user', 'cover_url'),
      upgrade_status: params.dig('user', 'upgrade_status'),
      store_on: params.dig('user', 'store_on'),
      affection: params.dig('user', 'affection'),
      avatars: {
        default: params.dig('user', 'avatars', 'default', 'https'),
        large: params.dig('user', 'avatars', 'large', 'https'),
        small: params.dig('user', 'avatars', 'small', 'https'),
        tiny: params.dig('user', 'avatars', 'tiny', 'https')
      }
    }
    @licensing_requested = params.dig('licensing_requested')
    @licensing_suggested = params.dig('licensing_suggested')
    @is_free_phot = params.dig('is_free_phot')
  end
end
