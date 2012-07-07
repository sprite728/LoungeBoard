require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password  # Since the password is not in the table anymore (is replaced by hashed_password)
                           # we need to add a reader and writer for password
  attr_accessible :email, :password, :password_confirmation
  
  validates :email, :presence => true,
                    :uniqueness => true,
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
                    
        
  validates :password, :presence => true,
                       :length => { :within => 4..20 },
                       :confirmation => true,
                       :if => :password_required?
            
  has_one :profile
  has_many :bluetooths
  
  before_save :encrypt_new_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)  #if the user is found && password match, return user
                                                          # otherwise return nil
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end


    def password_required?
      hashed_password.blank? || password.present?
    end
  
    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
