require "test_helper"

class UrlTest < ActiveSupport::TestCase

  test "Url should not save without long_url and short_url" do
    url = Url.new
    assert_not url.save, 'saved url without long_url and short_url'
  end

  test "Url should save with long_url and short_url" do
    url = urls(:one)
    assert url.save, 'URL with long_url and short_url NOT saved '
  end

  test "short_url should not be too long" do
    url = urls(:one)
    url.short_url = "a" * 9
    assert_not url.valid?
  end

  test "short_url should be unique" do
    url = urls(:one)
    duplicate_url = url.dup
    duplicate_url.long_url = "a"
    url.save
    assert_not duplicate_url.valid?
  end

  test "long_url should be unique" do
    url = urls(:one)
    duplicate_url = url.dup
    duplicate_url.short_url = "a"
    url.save
    assert_not duplicate_url.valid?
  end

  test "stats should be by default 0" do
    url = urls(:one)
    url.save
    assert_equal url.stats, 0
  end
end
