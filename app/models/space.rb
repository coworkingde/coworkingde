class Space < ActiveRecord::Base
  attr_accessible :city_id, :city_name, :color, :description, :email, :facebook, :infrastructure, :lat, :lng, :name, :permalink, :street, :twitter, :url, :zip

  belongs_to :city

  validates_presence_of :name#, :street, :city_name, :zip
  validates_presence_of :city_id

  validates_uniqueness_of :name

  before_validation :geocode_address, :insert_color

  acts_as_mappable

  def address
    "#{street} #{city_name}"
  end
  def full_address
    "#{street} #{zip} #{city_name}"
  end

  def url
    read_attribute(:url).to_s.starts_with?("http") ? read_attribute(:url) : "http://#{read_attribute(:url)}"
  end

  def insert_color
    self.color = self.city.try(:color) || %w{yellow green red blue}.rand if self.color.blank?
  end

  def insert_access_key
    self.access_key = SecureRandom.hex(5)
  end

  def geocode_address
    return if (lat.present? && lng.present?) && !(city_name_changed? || street_changed?)
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    return unless geo.success

    self.lat           = geo.lat
    self.lng           = geo.lng
    self.country_code  = geo.country_code
    self.region_name   = geo.state
    self.city_name     = geo.city
  end

end
