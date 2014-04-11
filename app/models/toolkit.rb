def random_word
  %w[
      Lorem ipsum dolor sit amet consectetur adipisicing elit 
      sed do eiusmod tempor incididunt ut labore et dolore magna 
      aliqua Ut enim ad minim veniam quis nostrud exercitation 
      ullamco laboris nisi ut aliquip ex ea commodo consequat
      Duis aute irure dolor in reprehenderit in voluptate velit 
      esse cillum dolore eu fugiat nulla pariatur
  ].sample
end

class Categories
  def self.get
    ["Uncategorized", "My Category", "Another Category", "Third"]
  end
end

class Toolkit
  def initialize
  end

  def matters
    # GET /matters/
    result = []
    4.times do
      result << Matter.random
    end

    result
  end

  def matter_items
    # GET /matters/:matter_slug/items/
    result = []
    10.times do
      result << MatterItem.random
    end

    result
  end
end

class Matter
  def self.random
    {
      name: "LawPal (#{random_word})", 
      client: nil, 
      lawyer: "http://localhost:8000/api/v1/users/rosslawyer/", 
      participants: [
          "http://localhost:8000/api/v1/users/rossc/"
      ]
    }
  end
end

class MatterItem
  def self.random
    {
      status: "New",
      name: "#{random_word} #{random_word}",
      description: "stuff goes here #{random_word}",
      matter: "http://localhost:8000/api/v1/matters/lawpal-internal/",
      parent: nil,
      children: [],
      closing_group: nil,
      latest_revision: nil,
      is_final: false,
      is_complete: false,
      date_due: nil,
      category: Categories.get.sample
    }
  end
end