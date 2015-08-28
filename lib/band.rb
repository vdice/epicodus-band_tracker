class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, {:presence => true})
  before_save(:capitalize_name)

private
  define_method(:capitalize_name) do
    capitalized_words = []
    self.name().split(" ").each() do |word|
      capitalized_words.push(word.capitalize())
    end
    self.name=capitalized_words.join(" ")
  end
end
