#!/usr/bin/env ruby

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require "test/unit"
require "feedalizer"

class TestFeedalizer < Test::Unit::TestCase
  TEST_FILE = File.join(File.dirname(__FILE__), "test.html")

  def setup
    @feedalizer = Feedalizer::Feed.new(TEST_FILE)
  end

  def test_construction
    assert_kind_of RSS::Maker::RSS20::Channel, @feedalizer.feed
    assert_kind_of Hpricot::Doc, @feedalizer.page
  end

  def test_block
    inside = nil
    Feedalizer::Feed.new(TEST_FILE) { inside = self } rescue nil
    assert_kind_of Feedalizer::Feed, inside
  end

  def test_defaults
    assert_equal TEST_FILE, @feedalizer.feed.link
    assert_equal "Scraped from #{TEST_FILE}", @feedalizer.feed.description
  end

  def test_page
    assert_equal "Test", @feedalizer.page.search("html/head/title").text
  end

  def test_scrape_items
    elements = []

    @feedalizer.scrape_items("div.item") do |item, element|
      elements << element

      assert_kind_of RSS::Maker::RSS20::Items::Item, item
      assert_kind_of Hpricot::Elem, element
    end

    assert_equal 2, elements.size
  end

  def test_scrape_items_limit
    elements = []

    @feedalizer.scrape_items("div.item", 1) do |item, element|
      elements << element
    end

    assert_equal 1, elements.size
  end

  def test_grab_page
    assert_kind_of Hpricot::Doc, @feedalizer.grab_page(TEST_FILE)
  end
  
  def test_existance_of_generator
    f = @feedalizer.feed
    
    f.about = f.title = f.description = "..."
    
    assert @feedalizer.output.include?("Feedalizer")
  end

  def test_output
    f = @feedalizer.feed
    
    f.about = f.title = f.description = "..."

    output = @feedalizer.output

    assert output.include?("<rss")
    assert output.size > 320
  end
  
  def test_backwards_compatibility
    assert @feedalizer.respond_to?(:page)
    assert @feedalizer.respond_to?(:parse_source)
  end
end
