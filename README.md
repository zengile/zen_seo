#ZEN_SEO is a clean way of managing your meta tags for resources
## Install
Hope all of us are at least on Rails3 and moving to upcoming Rails4(unsupported for now)
```sh
    # Gemfile
    gem 'zen_seo'
```
Then run the install generator, that will create migration(MongoDB is on the routemap) for the SEO model.
```sh
    rails generate zen_seo:install
```

## Usage
Pick up a resource to grant a promotable behavior
### Model

```ruby
   #app/models/post.rb
   has_seo
```

This will try to call `title`, `description`, `keywords` on your model to fill in seo fields, optionally you can  supply a hash, that redefines the methods to be called

```ruby
   #app/models/post.rb
   class Post < ActiveRecord::Base
     attr_accessible :body, :tags, :title
     has_seo :description=>:body, :keywords=>:make_keywords

     private
     def make_keywords
       self.tags.gsub(/:/, ', ')
     end
   end
```

###Controller

ZEN_SEO heavily based on [meta_tags](https://github.com/kpumuk/meta-tags) gem, so set it up as normal.

When your layout contains
```ruby
    #application.html.erb
    <head>
      <%= display_meta_tags default_meta_tags %>
    </head>
```
now in controller you can use `meta_tags_for` helper
```ruby
    #posts_controller.rb
    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = Post.find(params[:id])
      meta_tags_for @post
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    end
```
###Form
To set meta tags for your resource just put `fields_for :seo` in your form. Like this:
```erb
  <h3>Make yout post seo-friendly</h3>
  <%= f.fields_for :seo do |seo| %>
    <div class="field">
      <%= seo.label :title %><br />
      <%= seo.text_field :title %>
    </div>
    <div class="field">
      <%= seo.label :keywords %><br />
      <%= seo.text_field :keywords %>
    </div>
    <div class="field">
      <%= seo.label :description %><br />
      <%= seo.text_area :description %>
    </div>
  <% end %>
```

## Note on Patches/Pull Requests

* Any help on issues-fighting(or finding) and testing is highly appreciated

## Copyright

Sergey Prikhodko originally developed by Jared Pace Copyright (c) 2010. See LICENSE for details.