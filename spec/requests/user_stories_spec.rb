require 'rails_helper'
require "selenium-webdriver"
require 'watir'

RSpec.describe "UserStories", :type => :request do
  describe "Watir" do
    it "should do some stuff" do
      browser = Watir::Browser.new
      browser.goto("http://localhost:3000")
      expect(browser.title).to eq('Linky') 
      browser.link(text: "Account").click
      browser.link(text: "Sign In").click
      browser.text_field(id: "user_email").set("test@test.com")
      browser.text_field(id: "user_password").set("password")
      browser.form(id: "new_user").submit
      assert browser.text.include? 'Signed in successfully.'
      browser.link(text: "Add a link").click
      link_title = "This was set with Watir"
      browser.text_field(id: "link_title").set( link_title )
      browser.text_field(id: "link_url").set("http://www.google.com")
      browser.button(:value, "Yeah Boy").click
      assert browser.text.include? link_title
      browser.close
      
    end
  end
end
