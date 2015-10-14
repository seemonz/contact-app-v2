require_relative 'contactv2'

# REPL yay!@

def get_input
  input = gets.chomp
  return input
end

def repl
  help
  command = 0
  while command != 'exit'
    puts 'command:'
    command = get_input

    if command == 'exit'
      puts 'Good Bye...'
      break
    end

    case command
    when 'all' then list_all
    when 'find id'
      puts 'type id:'
      id = get_input
      find_id(id)
    when 'find fname'
      fname = get_input
      find_fname(fname)
    when 'find lname'
      lname = get_input
      find_lname(lname)
    when 'find email'
      email = get_input
      find_email(email)
    when 'create'
      create
    when 'delete'
      id = get_input
      delete(id)
    when 'help' then help
    end
  end
end

def help
  puts "Commands as follows:"
  puts "all - lists all contacts in the database"
  puts "find id - returns contact with the id specified"
  puts "find fname - returns contacts with matching first name"
  puts "find lname - returns contacts with matching last name"
  puts "find email - returns contacts with matching email"
  puts "create - inserts or updates contact data"
  puts "exit - closes program"
end

# rather messy, would be nice to refactor
def create
  puts 'first name:'
  fname = gets.chomp
  puts 'last name:'
  lname = gets.chomp
  puts 'email'
  email = gets.chomp
  contact_hash = {
    :id => nil,
    'firstname' => fname,
    'lastname' => lname,
    'email' => email
  }
  contact = Contact.new(contact_hash)
  contact.save
end

def delete(id)
  current = Contact.find_by_id(id)
  current.delete
end

def list_all
  puts Contact.all
end

def find_id(id)
  puts Contact.find_by_id(id)
end

def find_fname(first)
  puts Contact.find_by_first_name(first)
end

def find_lname(last)
  puts Contact.find_by_last_name(last)
end

def find_email(address)
  puts Contact.find_by_email(address)
end

repl
