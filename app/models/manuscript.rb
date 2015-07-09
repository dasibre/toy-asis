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

  def author_match?(author_params)
  	lastname = author_params.strip.downcase
  	manuscript_authors = self.authors
  	manuscript_authors.select {|author| author_match_to_params(author.last_name.downcase,lastname)}.any?
  end

  private
  
  def author_match_to_params(author_lastname, author_params)
  	author_lastname.start_with?(author_params[0,3]) && author_params.length > 1 &&
    (author_params.length == author_lastname.length || author_params.length > 2 )
  end
end
