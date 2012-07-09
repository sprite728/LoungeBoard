require 'digest/sha2'
class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :bluetooths_attributes
  
  validates :name, :presence => true, 
                   :uniqueness => true,
                   :length => { :within => 5..20 }
                   
  validates :email, :presence => true,
                   :length => { :within => 5..50 },
                   :uniqueness => true              
  validates :password, :confirmation => true,
                       :length => { :within => 4..20 },
                       :presence => true,
                       :if => :password_required?
                      
  attr_accessor :password
  
  # Associations
  has_many :bluetooths
  accepts_nested_attributes_for :bluetooths
  
  before_save :encrypt_new_password
  
  # Class methods  
  def self.authenticate(name, password)
    user = find_by_name(name)
    return user if user && user.authenticated?(password)
  end
  
  def authenticatded?(password)
    self.hashed_password == encrypt_password(password)
  end
  
  
  protected
    def encrypt_new_password
      return if password.blank?
      generate_salt
      self.hashed_password = encrypt_password(password, salt)
    end
  
    # only when a new password present, validation is required
    def password_required?
      hashed_password.blank? || password.present?
    end
    
    
    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "cloudatlas" + salt)
    end
  
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
