require "rspec"
require "watir-webdriver"

describe "The portal-facade-ng/login_test.html" do

  before :all do
    @browser = Watir::Browser.new(:firefox)
  end

  before :each do
    @browser.goto("172.20.0.4/portal-ng/")
  end

  it "should find 10 profiles" do
    @browser.div(:id, "Main_ApplicationSpace_HalfLeftList").divs.count.should == 10
  end

  it "should enter into the portal and should see mosaic" do
    sleep 3
    @browser.send_keys(:return)
    sleep 3
    @browser.send_keys(:f3)
    @browser.send_keys(:return)
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
  end
end