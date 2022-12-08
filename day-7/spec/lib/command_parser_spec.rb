require_relative '../../lib/command_parser.rb'
require_relative '../../lib/file_system.rb'

RSpec.describe CommandParser do
  describe '.new' do
    it 'creates a new instance of the class' do
      parser = CommandParser.new()
      expect(parser).to be_a(CommandParser)
    end
  end

  describe 'exec' do
    context 'with a cd to root' do
      it 'changes fs to root' do
        fs = FileSystem.new()
        parser = CommandParser.new()
        parser.exec("$ cd /", fs)
        expect(fs.current).to be(fs.root)
      end
    end

    context 'with a cd back' do
      it 'changes fs to root' do
        fs = FileSystem.new()
        fs.add_dir(Dir.new("a"))
        fs.change_dir("a")

        parser = CommandParser.new()
        parser.exec("$ cd ..", fs)
        expect(fs.current).to be(fs.root)
      end
    end

    context 'with a cd to x' do
      it 'changes fs to root' do
        fs = FileSystem.new()
        dir = Dir.new("x")
        fs.add_dir(dir)
        fs.change_dir("/")

        parser = CommandParser.new()
        parser.exec("$ cd x", fs)
        expect(fs.current).to be(dir)
      end
    end

    context 'with a dir' do
      it 'adds new dir' do
        fs = FileSystem.new()
        parser = CommandParser.new()
        parser.exec("dir a", fs)
        fs.change_dir("a")
        expect(fs.current.name).to eq("a")
      end
    end

    context 'with a file' do
      it 'adds new dir' do
        fs = FileSystem.new()
        parser = CommandParser.new()
        parser.exec("14848514 b.txt", fs)
        expect(fs.current.files.length).to eq(1)
        expect(fs.current.files[0].name).to eq("b.txt")
        expect(fs.current.files[0].size).to eq(14848514)
      end
    end
  end
end