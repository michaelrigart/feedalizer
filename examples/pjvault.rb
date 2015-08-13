#!/usr/bin/env ruby

# This script was contributed by Christian Neukirchen, thanks!

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'feedalizer'
require 'time'

feedalize('http://pjvault.com/news77.html') do
  feed.title = 'Pearl Jam Vault'
  feed.description = 'Pearl Jam News and Reviews'

  scrape_items('//LI') do |rss_item, html_element|
    link = html_element.xpath('a').first

    rss_item.link  = link.get('href')
    rss_item.title = link.inner_text

    rss_item.description = html_element.inner_text
  end

  output!
end
