class ValidatorClass < ActiveModel::Validator
  def validate(record)
      if record.phone_num == 0000000000
          record.errors.add :phone_num, "you can't use this number"
      end
  end
end


class User < ApplicationRecord
  has_secure_password
  


  validates :name, presence: true
 
  

  validates :name, exclusion: { in: %w(akash yash),
    message: "%{value} is not available." }

    validates :name, format: { with: /\A[a-zA-Z]+\z/,
      message: ": you can't enter number" }

      validates :name, inclusion: { in: %w(small medium large),
        message: "%{value} is not a valid size" }

        validates :name, length: { minimum: 5,
          message:":name should be atleat 5 letter"}

  validates :email, confirmation: {case_sensitive: false}

  validates :phone_num, comparison: { greater_than: :pincode }


  # validates :password, numericality: true

  validates :password, numericality: { only_integer: true }

  validates :name, uniqueness: true
  # validates :name, uniqueness: {message: "name is already taken"}



  # validates :name,  absence: {message: "name must be empty"} #check if filed is empty or not
    
  validates_each :name, :city do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end


  
  
  #if the value is blank it will allows it but the value less then the 5 letter won't be allow
  validates :city, length: { is: 5 }, allow_blank: true

  validates :city, length: { is: 5 }, allow_nil: true


  validates :name,
    uniqueness: {
      message: ->(object, data) do
        " #{data[:value]} is already taken. Try another name"
      end
    }

    validates :password, numericality: { message: "%{value} seems wrong" }
    
    validates :password, numericality: { greater_than: 10 }
    
    validates :password, numericality: { greater_than_or_equal_to:  10 }
    
    validates :name, presence: { strict: true }


    validates_with ValidatorClass

  # before validation choose funciton will be called and if the name length will be less then 5 then and only then it will check validation
    validates :name, uniqueness: true, if: :choose
    def choose
       name.length < 5
    end


    with_options if: :check do |admin|
      admin.validates :password, length: { minimum: 10 }
      admin.validates :email, presence: true
    end
    def check
         name.length < 5
    end
end


