module Cards
  class Card
    include MetaClass
    attributes :title, :type, :text, :description
  end
end