require 'file_size_validator'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable
  
  mount_uploader :image, AvatarUploader
  acts_as_voter
  acts_as_follower
  acts_as_followable

  has_one :profile, inverse_of: :user, dependent: :destroy
  has_many :articles, dependent: :destroy  
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :profile
  
  validates :name, presence: true
  validates :image, :file_size => { :maximum => 0.5.megabytes.to_i }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  
  def to_param
    "#{id}-#{name}".parameterize
  end   
  
  def crop_avatar
    self.image.recreate_versions! if crop_x.present?
  end

  def self.follower(user)
    user.following_users.pluck(:id)
  end


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email =  auth.info.email || "#{auth.uid}@notdefined.com"
      user.name = auth.info.nickname || auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

 
end
