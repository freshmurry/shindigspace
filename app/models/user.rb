class User < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "profile-photo.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable  

  validates :fullname, presence: true, length: {maximum: 50}
  
  has_attached_file :image, :default_url => "profile-photo.png"

  has_many :venues, dependent: :delete_all
  has_many :reservations
  
  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
  has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"
  has_many :notifications
  
  has_one :setting, dependent: :destroy
  has_many :settings, dependent: :destroy
  after_create :add_setting

  def add_setting
    Setting.create(user: self, enable_sms: true, enable_email: true)
  end
    
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider

        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end

  def generate_pin
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end
  
  def send_pin
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+14043412701',
      to: self.phone_number,
      body: "Your ShindigSpace pin is #{self.pin}"
    )
  end

  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end

  def is_active_host
    !self.merchant_id.blank?
  end
  
  def user_params
    params.require(:user).permit(image: [:image_file_name, :image_file_size, :image_content_type, :image_updated_at])
  end
end

# Strict password security measures. *Uncomment when app goes live!*
  # validates :password, :presence => true,
  #                   :on => :create,
  #                   :format => {:with => /\A.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\!\@\#\$\%\^\&\+\=]).*\Z/ }