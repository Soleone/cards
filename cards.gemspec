# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cards}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Soleone"]
  s.date = %q{2009-02-03}
  s.description = %q{Create different types of cards in any setting (fantasy, real, science-fiction) that can fight with each other.}
  s.email = %q{soleone@gmail.com}
  s.files = ["README.textile", "VERSION.yml", "lib/cards", "lib/cards/behavior", "lib/cards/behavior/fighting.rb", "lib/cards/card.rb", "lib/cards/creatures", "lib/cards/creatures/creature.rb", "lib/cards/creatures/human.rb", "lib/cards/errors.rb", "lib/cards/lib", "lib/cards/lib/meta_class.rb", "lib/cards.rb", "spec/behavior", "spec/behavior/fighting_spec.rb", "spec/card_spec.rb", "spec/creatures", "spec/creatures/creature_spec.rb", "spec/creatures/human_spec.rb", "spec/lib", "spec/lib/meta_class_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Soleone/cards}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Tiny Framework for creating card based games like Magic: The Gathering.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
