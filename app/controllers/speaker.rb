Devdayapi.controllers :speaker do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    @speakers = Speaker.all()
    render 'speaker/index'
  end

  get :show, :with => :id do
    @speakers = Speaker.find_by_id(params[:id])
    render 'speaker/show'
  end

end
