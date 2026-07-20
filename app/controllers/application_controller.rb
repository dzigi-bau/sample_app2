class ApplicationController < ActionController::Base
  def hello
    render html: "Hey zekice"
  end
end
