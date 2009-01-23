lib = %w[lib/meta_class card creatures/creature creatures/human]
lib.each do |file|
  require File.dirname(__FILE__) + "/cards/#{file}.rb"
end