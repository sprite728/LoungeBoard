
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.bluetooths.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # # GET /users/1/edit
  # def edit
    # @user = User.find(params[:id])
  # end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    # @bluetooth = Bluetooth.new(params[:mac_addr])
    # @user.bluetooths << @bluetooth if Bluetooth.find_by_mac_addr(@bluetooth.mac_addr)
#     
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => "User #{@user.name} was successfully created." }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
