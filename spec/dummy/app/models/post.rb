class Post < ActiveRecord::Base
  attr_accessible :body, :tags, :title
  has_seo :description=>:body,
          :keywords=>:make_keywords,
          :options=>{
              :og => {
                :title    => :title,
                :type     => 'website',
                :image    => 'http://now.com/you_rock.jpg'
              }
          }
  private
  def make_keywords
    self.tags.gsub(/:/, ', ')
  end
end
