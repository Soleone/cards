lib = %w[lib/meta_class behavior/fighting behavior/effects behavior/abilities card creatures/creature creatures/human creatures/animal]
lib.each do |file|
  require File.dirname(__FILE__) + "/cards/#{file}.rb"
end