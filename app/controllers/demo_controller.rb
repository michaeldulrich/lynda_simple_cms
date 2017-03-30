class DemoController < ApplicationController

  layout 'application'

  def index
    render('index')
  end

  def hello
    render('hello')
    @id = params[:id]
    @page = params[:page]
  end

  def other_hello
    redirect_to(:controller => 'demo' , :action => 'index')
  end

  # def escape_output
  #
  # end

end
