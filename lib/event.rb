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
  end

  def is_soon?()
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

end