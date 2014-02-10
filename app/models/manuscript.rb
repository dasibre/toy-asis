class Manuscript
  include Mongoid::Document

  embeds_many :authors

  field :code, type: String
  field :title, type: String
  field :status, type: String
  field :status_date, type: Date

  def self.find_by_code(code)
  	find_by(code: code)
  end


  def get_authors
  	authors
  end

  def author_match?(author_params)
  	lastname = author_params.split(',').first
  	manuscript_authors = self.get_authors
  	manuscript_authors.select {|author| author.last_name.match(lastname)}.any? #have to sanitize the author_params
  end
end
