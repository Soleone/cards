lib = %w[lib/metaboost card creature creatures/human]
lib.each do |file|
  require File.dirname(__FILE__) + "/cards/#{file}.rb"
end