class CommandParser
  def exec(command, fs)
    cd = /\$ cd (?<command_name>.*)/ =~ command
    fs.change_dir(command_name) if cd
    
    dir = /dir (?<dir_name>.*)/ =~ command
    fs.add_dir(Dir.new(dir_name)) if dir

    file = /(?<file_size>\d+) (?<file_name>.*)/ =~ command
    fs.add_file(FileRecord.new(file_name, file_size.to_i)) if file
  end
end