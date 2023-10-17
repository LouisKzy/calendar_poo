require "pry"

class User

  attr_accessor :email, :age # variable d'instance

  @@all_user = [] # variable de classe

  def initialize(email_to_save, age_to_save)
    @email = email_to_save
    @age = age_to_save
    puts "Email et age sauvegardé !!"
    @@all_user << self
  end

  def self.all 
    @@all_user
  end

  def self.find_by_email(email_str)
    @@all_user.each do |user|
      if email_str == user.email
        return user
      end
    end
    error = "Utilisateur non trouvé"
    return error
  end

end
 