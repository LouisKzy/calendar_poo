require "pry"


class EventCreator

  def initialize
    create_event
  end

  def create_event
    puts "Salut, tu veux créer un événement ? Cool !"
    puts "Commençons. Quel est le nom de l'événement?"
    title = gets.chomp

    puts "Super. Quand aura-t-il lieu? (année-mois-jour heure:minutes // exemples : 2019-01-13 09:00 )"
    start_date = gets.chomp

    puts "Au top. Combien de temps va-t-il durer (en minutes)?"
    duration = gets.chomp.to_i

    puts "Génial. Qui va participer ? Balance leurs e-mails (séparés par des points-virgules)"
    attendees = gets.chomp.split(';').map(&:strip)

    new_event = Event.new(start_date, duration, title, attendees)

    puts "Super, c'est noté, ton événement a été créé!"
    puts "Voici les détails de l'événement :"
    puts new_event
  end

end