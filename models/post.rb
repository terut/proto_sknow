# coding: utf-8
class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :raw_body
  field :tags, :type => Array

  RC_OPTIONS = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode, :tables]

  def body
    src = block_given? ? yield(raw_body) : raw_body
    Redcarpet.new(src, *RC_OPTIONS).to_html.html_safe
  end

  def tags=(tags)
    @tags = tags.to_s.gsub("　"," ").split(" ")
  end
end
