require 'spec_helper'

describe Post do
  before(:each) do
    @post = Post.new
  end

  it 'zen_seo should be bootstrapped' do
    Post.respond_to?(:has_seo).should be_true
  end

  it "should have seo association" do
    @post.respond_to?(:seo).should be_true
  end

  it 'should save post with predefined seo fields' do
    @post = Post.new(
        :title  =>    'Title',
        :body   =>    'Body',
        :tags   =>    'keywords',
        :seo_attributes=>{
            :title      =>  'seo_title',
            :description=>  'seo_description',
            :keywords   =>  'key, word'})
    @post.should be_valid
  end

  it 'should generate seo  fields if no value given' do
    @post= Post.new(
        :title  =>    'Title',
        :body   =>    'Body',
        :tags   =>    'keywords:some')
    @post.should be_valid
  end

  it 'should generate seo  fields if no value given' do
    @post= Post.new(
        :title  =>    nil,
        :body   =>    'Body',
        :tags   =>    'keywords')
    @post.should_not be_valid
  end
end