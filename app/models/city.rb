class City < ActiveRecord::Base
  attr_accessible :lat, :lng, :name, :permalink

  has_many :spaces, :dependent => :nullify
  validates_presence_of :name

end
