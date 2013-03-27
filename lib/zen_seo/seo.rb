class Seo < ActiveRecord::Base
  attr_accessible :description, :keywords, :title, :promotable_type, :promotable_id
  belongs_to :promotable, :polymorphic => true

  validates_presence_of :title, :keywords, :description

end