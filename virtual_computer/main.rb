class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @files_attr = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    file = File.new(filename, time)
    @files[filename] = file
    self.update_files_attributes
    puts "A new file named '#{filename}' at #{time} was created by '#{@username}'."
    puts "\n-->If you want to modify this file, use #modify_file('#{filename}')\n\n"
  end

  def list_files
    puts "\nFiles in '#{@username}' profile: "
    @files.keys.each { |file| print "  #{file}  " }
    puts
  end

  def modify_a_file(filename)
    puts "\nModifying '#{filename}'..."
    return p "no such file in '#{@username}'" unless @files.key?(filename)

    previous_content = @files[filename].instance_variable_get('@content')
    puts "\nEnter the new content:"
    new_content = gets.chomp
    mod_time = Time.now
    @files[filename].modify_file_content(new_content, mod_time)
    self.update_files_attributes
    puts "\nPrevious file content: \n#{previous_content}"
    puts "\n\nNew file content: \n#{@files[filename].instance_variable_get('@content')}"
    puts "--> Modification made at #{mod_time} by '#{@username}'"
  end

  def delete_a_file(filename)
    puts "\nDeleting file: #{filename}"
    return p "no such file in '#{@username}'" unless @files.key?(filename)

    @files.delete(filename)
    self.update_files_attributes
    puts "\n#{filename} deleted"
  end

  def rename_a_file(filename, new_filename)
    puts "\nRenaming file: #{filename}"
    return p "no such file in '#{@username}'" unless @files.key?(filename)

    @files[filename].rename_file(new_filename)
    @files[new_filename] = @files[filename]
    @files.delete(filename)
    self.update_files_attributes
    puts "\n-->File renamed"
  end

  def update_files_attributes
    attr_hash = {}
    @files.each do |filename, file|
      attr_hash[filename] = file.file_attributes
    end
    @files_attr = attr_hash
  end

  def show_a_file_attributes(filename)
    puts "\nShowing file attributes: #{filename}"
    return p "no such file in '#{@username}'" unless @files.key?(filename)

    self.update_files_attributes
    puts "\nFile '#{filename}' has:"
    @files_attr[filename].each {|property, value| puts "#{property}:   #{value}"}
  end

  def self.get_users
    @@users
  end
end

class File
  def initialize(filename, time)
    @filename = filename
    @content = ''
    @creation_time = time
    @modification_time = time
    @type = file_type(filename)
  end

  def file_type(filename)
    filename.split('.')[1]
  end

  def modify_file_content(values = '', time)
    @content += values
    @modification_time = time
  end

  def rename_file(new_filename)
    @filename = new_filename
  end

  def file_attributes
   { 'name' => @filename,
      'creation date' => @creation_time,
      'last modification' => @modification_time,
      'data type' => @type }
  end
end
my_computer = Computer.new('Gustavo', 'Alonso18!')
my_computer.create('test.txt')
my_computer.create('test2.txt')

my_computer.list_files

my_computer.modify_a_file('test2.txt')

my_computer.rename_a_file('test2.txt', 'test_file.txt')

my_computer.list_files

my_computer.modify_a_file('test_file.txt')

my_computer.list_files

my_computer.show_a_file_attributes('test_file.txt')
