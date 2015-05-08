class Client
  attr_reader :name, :id, :stylist_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  def ==(other_task)
    same_desc = @name == other_task.name
    same_id = @id == other_task.id
    same_stylist_id = @stylist_id == other_task.stylist_id
    same_desc && same_id && same_stylist_id
  end

  def self.all
    tasks = []
    results = DB.exec("SELECT * FROM clients;")
    results.each do |result|
      name = result.fetch("name")
      id = result.fetch("id").to_i
      stylist_id = result.fetch("stylist_id").to_i
      tasks.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    tasks
  end

  def save
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

end
