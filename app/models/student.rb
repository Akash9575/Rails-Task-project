class Student < ApplicationRecord



  validates :name, presence: true

  validates :email, presence: true


  before_validation :ensure_login_has_a_value
  private
    def ensure_login_has_a_value
      if name.nil?
        puts "you must enter the name"
      end
     
      if email.nil?
        puts "you must enter the Email address"
      end
    end


    before_create do
      puts "before cerating a object it will call this function "
    end


    after_validation :set_status

    private
      def set_status 
        puts "this funciton is called after the validation"
      end


      after_initialize do |student|
        puts "You have initialized an object!"
      end
    
      after_find do |student|
        puts "You have found an object!"
      end


      after_touch do |student|
        puts "You have touched an object"
      end


      after_save do |student|
        puts "print After Save an object"
      end

      before_update do |student|
        puts "print Before Update an object"
      end

      after_update do |student|
        puts "print After Update an object"
      end

      before_destroy do |student|
        puts "print Before Destroy an object"
       end

      after_destroy do |student|
        puts "print After Destroy an object"
      end


      after_find Call
       
end

