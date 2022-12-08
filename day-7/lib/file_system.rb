class Dir
  def initialize(name)
    @name = name
    @parent = nil
    @directories = []
    @files = []
  end

  def name
    @name
  end

  def parent
    @parent
  end

  def set_parent(parent)
    @parent = parent
  end


  def directories
    @directories
  end

  def files
    @files
  end

  def add_dir(dir)
    dir.set_parent(self)
    @directories << dir
  end

  def add_file(file)
    @files << file
  end

  def to_s
    "dir-#{@name}"
  end

  def size
    @directories.sum{|d| d.size } + @files.sum{|f| f.size}
  end

  def dirs_at_most(max_size, matches)
    if (size <= max_size)
      matches << [name, size]
    end

    @directories.each {|d|
      d.dirs_at_most(max_size, matches)
    }
  end
end

class FileRecord
  def initialize(name, size)
    @name = name
    @size = size
  end

  def name
    @name
  end

  def size
    @size
  end

  def to_s
    "file-#{@name}"
  end
end

class FileSystem
  def initialize
    @root = Dir.new("/")
    @current = @root
  end

  def root
    @root
  end

  def current
    @current
  end

  def directories
    @directories
  end

  def add_dir(dir)
    return if @current.directories.any?{|d| d.name == dir.name}
    @current.add_dir(dir)
  end

  def add_file(file)
    return if @current.files.any?{|f| f.name == file.name}
    @current.add_file(file)
  end

  def change_dir(name)
    case name
    when "/"
      @current = @root
    when ".."
      @current = @current.parent
    else
      @current.directories.each {|dir|
        if dir.name == name
          @current = dir
          break
        end
      }
    end
  end
end