class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :pin_event, :unpin_event]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show

    # @matches = UserEvent.select { |u_e| u_e.event_id == @event.id && ((u_e.shown_user_id == current_user.id && u_e.liked == 'yes') ||
    #  (u_e.shown_user_id != current_user.id))} 
    # @tinder = @matches.select { |user_event| User.find(user_event.user_id).gender != current_user.gender }

    my_matched_folk = %Q(
    SELECT * FROM users WHERE users.gender != "#{current_user.gender}" AND users.id NOT IN 
    (SELECT user_events.user_id FROM user_events INNER JOIN user_events AS also_likes_me
      ON user_events.user_id = also_likes_me.shown_user_id
      AND also_likes_me.liked = 'yes' AND also_likes_me.event_id = 1
      WHERE user_events.user_id = 21 AND user_events.liked = 'yes' AND user_events.event_id = 1)
    )
    @tinder = User.find_by_sql(my_matched_folk).reject{|e| !e.events.include?(@event)}
    binding.pry




  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pin_event
    event = Event.find_by_id(params["id"]) 
    current_user.events << event unless current_user.events.find_by_id(event.id)
    redirect_to "/events"
  end

  def unpin_event
    event = Event.find_by_id(params["id"]) 
    current_user.events.delete(event)
    redirect_to "/users/#{current_user.id}"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :venue, :street_number, :city, :sttate, :zip, :description, :url, :image, :category)
    end
end
