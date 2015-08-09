#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require "feedalizer"
require "time"

feedalize("http://sydsvenskan.se/serier/nemi/index.jsp?context=serie") do
  feed.title = "Nemi"
  feed.description = "Daily Nemi strip scraped from Sydsvenskan"

  scrape_items("option") do |rss_item, html_element|
    link = html_element.attributes["value"]
    date = Time.parse(html_element.inner_html)

    rss_item.title = [feed.title, date.strftime("%Y-%m-%d")].join(", ")
    rss_item.description = grab_page(link).search("//img[@width=600]")
    rss_item.date = date
    rss_item.link = link
    
    rss_item.guid.isPermaLink = true
    rss_item.guid.content = link
  end
  
  if __FILE__ == $0
    output!(ARGV[0] ? File.open(ARGV[0], "w") : STDOUT)
  end
end
