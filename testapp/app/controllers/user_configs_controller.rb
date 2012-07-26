class UserConfigsController < ApplicationController
  before_filter :authenticate_user!
  # GET /user_configs
  # GET /user_configs.json
  def index
    @user_configs = UserConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user_configs }
    end
  end

  # GET /user_configs/1
  # GET /user_configs/1.json
  def show
    @user_config = UserConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user_config }
    end
  end

  # GET /user_configs/new
  # GET /user_configs/new.json
  def new
    @user_config = UserConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user_config }
    end
  end

  # GET /user_configs/1/edit
  def edit
    @user_config = UserConfig.find(params[:id])
  end

  # POST /user_configs
  # POST /user_configs.json
  def create
    @user_config = UserConfig.new(params[:user_config])

    respond_to do |format|
      if @user_config.save
        format.html { redirect_to @user_config, :notice => 'User config was successfully created.' }
        format.json { render :json => @user_config, :status => :created, :location => @user_config }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_configs/1
  # PUT /user_configs/1.json
  def update
    @user_config = UserConfig.find(params[:id])

    respond_to do |format|
      if @user_config.update_attributes(params[:user_config])
        format.html { redirect_to @user_config, :notice => 'User config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_configs/1
  # DELETE /user_configs/1.json
  def destroy
    @user_config = UserConfig.find(params[:id])
    @user_config.destroy

    respond_to do |format|
      format.html { redirect_to user_configs_url }
      format.json { head :no_content }
    end
  end
end
