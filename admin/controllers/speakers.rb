Admin.controllers :speakers do

  get :index do
    @speakers = Speaker.all
    render 'speakers/index'
  end

  get :new do
    @speaker = Speaker.new
    render 'speakers/new'
  end

  post :create do
    #logger.warn params

    @speaker = Speaker.new(params[:speaker])
    @session = Speaker.new(params[:session])

    @speaker.sessions.build(session);
        
    if @speaker.save
      flash[:notice] = 'Speaker was successfully created.'
      redirect url(:speakers, :edit, :id => @speaker.id)
    else
      render 'speakers/new'
    end
  end

  get :edit, :with => :id do
    @speaker = Speaker.find(params[:id])
    render 'speakers/edit'
  end

  put :update, :with => :id do
    @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(params[:speaker])
      flash[:notice] = 'Speaker was successfully updated.'
      redirect url(:speakers, :edit, :id => @speaker.id)
    else
      render 'speakers/edit'
    end
  end

  delete :destroy, :with => :id do
    speaker = Speaker.find(params[:id])
    if speaker.destroy
      flash[:notice] = 'Speaker was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Speaker!'
    end
    redirect url(:speakers, :index)
  end
end
