require 'pry'
require 'time'

class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(date_string, number_minutes, title_string, attendees_array = [])
    @start_date = Time.parse(date_string)
    @duration = number_minutes
    @title = title_string
    @attendees = attendees_array
    puts @start_date
  end

  def end_date
   end_date = @start_date + (@duration * 60)
   return end_date
  end

  def is_past?
    return end_date < Time.now
  end

  def is_future? 
    return end_date > Time.now
  end

  def postpone_24h
    @start_date +=  24 * 60 * 60 # ajouter 24h en secondes
    puts "L'évenement a été reporté de 24h"
  end

  def is_soon?
    time = Time.now
    start_date_minus_time = @start_date - time # pour obtenir la différence en secondes
    if end_date < Time.now
      puts "L'évenement est déja terminé.."
      return true
    elsif start_date_minus_time < 30 * 60 
      puts "L'évenement commencera dans moins de 30 minutes"
      return true
    else
      puts "L'évement commencera dans plus de 30 minutes"
      return false
    end
  end

  def to_s
    puts ""
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date} "
    puts "Durée : #{@number_minutes} minutes"
    puts "Invités : #{@attendees.join(", ")}" # sinon sa affiche en array einstein
  end

  def age_analysis # premiere composition en POO
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement
  
    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end
  
    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne
  
    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end

end

class WorkEvent < Event

  attr_accessor :location

  def initialize(start_date, duration, title, attendees, location)
    @location = location # j'ai rajouté cette ligne

    super(start_date, duration, title, attendees) # fait appel au initialize de la classe Event methode super
  end

  def is_event_acceptable?
    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end

end