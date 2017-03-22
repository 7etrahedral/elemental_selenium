require 'selenium-webdriver'
require_relative 'login'

describe 'Login' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @login = Login.new(@driver)
  end

  after(:each) do
    @driver.quit
  end

  it 'succeeded' do
    @login.with('tomsmith', 'SuperSecretPassword!')
    expect(@login.success_message_present?).to eql true
  end

  it 'failed' do
    @login.with('asd', 'asdasd')
    expect(@login.failure_message_present?).to eql true
  end

end
