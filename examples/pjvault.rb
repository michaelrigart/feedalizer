#!/usr/bin/env ruby

# This script was contributed by Christian Neukirchen, thanks!

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require "feedalizer"
require "time"

feedalize("http://pjvault.com/news.html") do
  feed.title = "Pearl Jam Vault"
  feed.description = "Pearl Jam News and Reviews"

  scrape_items("li") do |rss_item, html_element|
    link = html_element.search("a").first

    rss_item.link  = link.attributes["href"]
    rss_item.date  = Time.parse(html_element.to_s)
    rss_item.title = link.children.last.to_s

    rss_item.description = html_element.inner_html
  end

  output!
end
