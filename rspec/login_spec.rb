require "rspec"
require 'watir-webdriver'

describe "The portal-facade-ng/login_test.html" do

  before :all do
    @browser = Watir::Browser.new(:firefox)
  end

  before :each do
    @browser.goto("http://172.20.0.4:8080/portal-facade-ng/login_test.html")
  end

  it "should pass successfully the authentication" do
    @browser.button(:name, 'submit').click
    @browser.text.should include('{success:true}')
  end

  it "should pass not successfully authentication" do
    @browser.text_field(:name, 'j_username').send_keys("01:01:01:01:01:01")
    @browser.text_field(:name, 'j_password').send_keys("111111111111111")
    @browser.button(:name, 'submit').click
    @browser.text.should include('')
  end

  after :all do
	  @browser.close unless @browser.nil?
  end

end