require 'pg'
require_relative 'connect'

class Contact
  include Connect

  def initialize(contact_hash)
    @id = contact_hash["id"]
    @firstname = contact_hash["firstname"]
    @lastname = contact_hash["lastname"]
    @email = contact_hash["email"]
  end

  def to_s
    return "#{@id}: #{@firstname} #{@lastname}, #{@email}, "
  end

  # grabs instance variables but skips over the id value
  def instance_variables_hash
    Hash[instance_variables.map { |name| [name[1..-1], instance_variable_get(name)] } ]
  end

  def save # pg paramatising
    if @id # <= we check to see if @id already exists and update if so
      statements = instance_variables_hash.select do |key, val| # <=creating an array that we can join in the UPDATE string
        key != "id"
      end.map do |key, val|
        "#{key}='#{val}'"
      end
      CONN.exec_params("UPDATE contacts SET #{statements.join(', ')} WHERE id=#{@id}")
    else
      CONN.exec_params("INSERT INTO contacts (firstname, lastname, email) VALUES ('#{@firstname}', '#{@lastname}', '#{@email}');")
    end
  end

  def delete
    if @id
      CONN.exec_params("DELETE FROM contacts WHERE id = #{@id}")
    else
      puts 'ID doesnt exist!'
    end
  end

  def self.convert_to_objects(results)
    contacts = []
    results.each do |result|
      contact = Contact.new(result)
      contacts << contact
    end

    return contacts
  end

  def self.all
    results = CONN.exec_params("SELECT * FROM contacts")
    return convert_to_objects(results)
  end

  def self.find_by_id(id)
    results = CONN.exec_params("SELECT * FROM contacts WHERE id=#{id}")
    objects = convert_to_objects(results)
    objects[0]
  end

  def self.find_by_first_name(name)
    results = CONN.exec_params("SELECT * FROM contacts WHERE firstname ILIKE '%#{name}%'")
    objects = convert_to_objects(results)
  end

  def self.find_by_last_name(name)
    results = CONN.exec_params("SELECT * FROM contacts WHERE lastname ILIKE '%#{name}%'")
    objects = convert_to_objects(results)
  end

  def self.find_by_email(email)
    results = CONN.exec_params("SELECT * FROM contacts WHERE email ILIKE '%#{email}%'")
    objects = convert_to_objects(results)
  end
end
