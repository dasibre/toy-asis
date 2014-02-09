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
end
