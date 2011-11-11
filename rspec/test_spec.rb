# encoding: utf-8

require "rspec"
require "watir-webdriver"

describe "Test" do

  before :all do
    @browser = Watir::Browser.new(:firefox)
  end

  before :each do
    @browser.goto("172.20.0.4/portal-ng/")
  end

  it "should do something" do
    #k = SomeModule::KeyboardKey.new
    sleep 3
    @browser.send_keys("\xee\x81\x81")
    print 1
  end

  after :all do
	  @browser.close unless @browser.nil?
  end
end