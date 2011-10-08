Devdayapi.controllers  do
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

  get '/' do
     "Hello world!"
  end

  before do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
  end

  get '/speak' do
    # Speaker.include_root_in_json = true
    Speaker.all.to_json
  end
  
end
