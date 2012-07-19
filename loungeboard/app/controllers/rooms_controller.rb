
class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, :notice => 'Room was successfully created.' }
        format.json { render :json => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.json { render :json => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, :notice => 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end
  
  # GET /rooms/:id/get_visitors
  # GET /rooms/:id/get_visitors.xml
  def get_visitors 
    room = Room.find_by_name(params[:name])
    @bluetooths = room.bluetooths.where("updated_at > ?", 10.seconds.ago.to_s)
    @users = []
    @bluetooths.each do |bt|
      @users << bt.user
    end
    
    respond_to do |format|
      format.html # get_visitors.html.erb
      format.json { render :json => @users }
      format.xml { render :xml => @users }
    end
  end
  
  def update_visitors
    room = Room.find_by_name(params[:name])
    #check if the specified bluetooth is existed
    @bluetooth = Bluetooth.find_by_mac_addr(params[:mac_addr])
    
    if @bluetooth # if bluetooth exist in database
      # Check if the detected bluetooth is already in the room
      if @bluetooth.room_id != room.id # if not in the room, hook it up to the room with room_id = params[:id]
        @bluetooth.room_id = room.id
      end
      @bluetooth.updated_at = Time.now
      @bluetooth.save
    end
#     
    # respond_to do |format|
      # format.html
      # format.json { render :json => @bluetooth }
      # format.xml { render :xml => @bluetooth }
    # end
  end
  
end
