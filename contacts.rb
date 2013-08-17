require 'highline/import'

class Person
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :phone
  attr_accessor :age

  def full_name
    first_name + " " + last_name
  end
end

class Contacts
  def self.run
    people = []

    loop do
      command = ask("> ")

      if command == "list"
        puts "Name".ljust(30) + "Phone".ljust(20) + "Age".ljust(3)
        puts "-" * 53
        people.each do |person|
          puts person.full_name.ljust(30) + person.phone.ljust(20) + person.age.ljust(3)
        end

      elsif command == "add"
        person = Person.new

        person.first_name = ask("First Name: ")
        person.last_name  = ask("Last Name: ")
        person.phone      = ask("Phone: ")
        person.age        = ask("Age: ")

        people.push(person)
      elsif command == "quit"
        break
      end
    end
  end
end

Contacts.run
