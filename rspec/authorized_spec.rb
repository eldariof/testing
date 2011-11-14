require "rspec"
require "watir-webdriver"
require "headless"
load "keyboard.rb"

describe "The portal-facade-ng/login_test.html" do

  before :all do
    begin
      @headless = Headless.new
      @headless.start
    rescue Headless::Exception => ex
      print ex.message
    end
    @browser = Watir::Browser.new(:firefox)
  end

  before :each do
    @browser.goto("172.20.0.4/portal-ng/")
    @browser.execute_script(Keyboard::PLATFORM_CODES)
  end

  it "should find 10 profiles" do
    @browser.div(:id, "Main_ApplicationSpace_HalfLeftList").divs.count.should == 10
  end

  it "should enter into the portal and should see mosaic" do
    sleep 3
    @browser.send_keys(Keyboard::ENTER)
    sleep 3

    @browser.send_keys(Keyboard::NUMB1)
    @browser.send_keys(Keyboard::ENTER)
    sleep 10

    images = @browser.images
    count = images.count
    count.should == 10
    i = 0
    while(i < count - 1)
      images[i].width.should == 180
      images[i].height.should == 135
      i += 1
    end
  end

  after :all do
	  @browser.close unless @browser.nil?
    @headless.destroy unless @headless.nil?
  end
end