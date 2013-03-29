class Post < ActiveRecord::Base
  attr_accessible :body, :tags, :title
  has_seo :description=>:body, :keywords=>:make_keywords
  private
  def make_keywords
    self.tags.gsub(/:/, ', ')
  end
end
