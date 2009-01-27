module Cards
  class Card
    include MetaClass
    attributes :title, :type, :text, :description
    
    def type
      self.class.name.split("::").last
    end
  end
end