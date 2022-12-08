require_relative '../../lib/file_system.rb'

RSpec.describe FileSystem do
  describe '.new' do
    it 'creates a new instance of the class with a root dir' do
      fs = FileSystem.new()
      expect(fs).to be_a(FileSystem)
      expect(fs.root).to be_a(Dir)
      expect(fs.root.name).to eq("/")
      expect(fs.current).to be_a(Dir)
      expect(fs.current.name).to eq("/")
    end
  end

  describe 'add_dir' do
    context 'with a dir' do
      it 'creates a new child directory in current' do
        fs = FileSystem.new()
        dir1 = Dir.new("a")
        dir2 = Dir.new("b")

        fs.add_dir(dir1)
        expect(fs.root.directories.length).to eq(1)
        expect(fs.root.directories[0]).to be(dir1)

        fs.add_dir(dir2)
        expect(fs.root.directories.length).to eq(2)
        expect(fs.root.directories[1]).to be(dir2)
      end

      it 'ignores duplicates' do
        fs = FileSystem.new()
        dir1 = Dir.new("a")
        duplicate = Dir.new("a")

        fs.add_dir(dir1)
        fs.change_dir("/")
        fs.add_dir(duplicate)
        expect(fs.current).to be(fs.root)
        expect(fs.root.directories.length).to eq(1)
      end
    end
  end

  describe 'add_file' do
    context 'with a file' do
      it 'creates a new child file in current' do
        fs = FileSystem.new()
        file = FileRecord.new("a.txt", 1000)

        fs.add_file(file)
        expect(fs.current.files.length).to eq(1)
        expect(fs.current.files[0]).to be(file)
      end

      it 'ignores duplicates' do
        fs = FileSystem.new()
        file1 = FileRecord.new("a.txt", 1000)
        file2 = FileRecord.new("b.txt", 1000)
        duplicate = FileRecord.new("b.txt", 1000)

        fs.add_file(file1)
        fs.add_file(file2)
        expect(fs.current.files.length).to eq(2)

        fs.add_file(duplicate)
        expect(fs.current.files.length).to eq(2)
      end
    end
  end

  describe 'change_dir' do
    context 'with sub directory name' do
      it 'moves current to the appropriate directory' do
        fs = FileSystem.new()
        dir1 = Dir.new("a")
        dir2 = Dir.new("b")
        fs.add_dir(dir1)
        fs.add_dir(dir2)

        fs.change_dir("b")
        expect(fs.current).to be(dir2)

        fs.change_dir("/")
        expect(fs.current).to be(fs.root)

        fs.change_dir("a")
        expect(fs.current).to be(dir1)
      end
    end
  end

  context 'with ..' do
    it 'moves current to the appropriate directory' do
      fs = FileSystem.new()
      dir1 = Dir.new("a")
      fs.add_dir(dir1)

      fs.change_dir("a")
      expect(fs.current).to be(dir1)

      fs.change_dir("..")
      expect(fs.current).to be(fs.root)
    end
  end
end