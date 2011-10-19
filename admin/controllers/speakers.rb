Admin.controllers :speakers do

  get :index do
    @speakers = Speaker.all
    render 'speakers/index'
  end

  get :new do
    @speaker = Speaker.new
  
    @slots = []
    TimeSlot.all(:order=>:datetime.asc).each do |i|
      @slots.push(["#{i._id} #{i.datetime.strftime('%a @ %I:%M%p')}", i._id])
    end

    @rooms = []
    Room.all(:order=>:name.asc).each do |i|
      @rooms.push([i.name, i._id])
    end

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

    @slots = []
    TimeSlot.all(:order=>:datetime.asc).each do |i|
      @slots.push(["#{i._id} #{i.datetime.strftime('%a @ %I:%M%p')}", i._id])
    end

    @rooms = []
    Room.all(:order=>:name.asc).each do |i|
      @rooms.push([i.name, i._id])
    end
    
    @selected_slot = @speaker.time_slot
    @selected_room = @speaker.room
    logger.warn @selected_slot

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
