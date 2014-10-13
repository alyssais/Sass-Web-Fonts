require 'sass'
require 'minitest/spec'
require 'minitest/autorun'

Sass.load_paths << File.dirname(__FILE__)

Dir.glob("test/**/*.s{a,c}ss").each do |file|
  describe file do
    it "compiles correctly" do
      expected = file.sub(/\.s[ac]ss/, '.css')
      syntax = File.extname(file)[1..-1].to_sym
      css = Sass.compile(open(file).read, syntax: syntax, filename: file)
      css.must_equal open(expected).read
    end
  end
end
