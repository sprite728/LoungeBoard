
class BluetoothsController < ApplicationController
  # GET /bluetooths
  # GET /bluetooths.json
  def index
    @bluetooths = Bluetooth.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @bluetooths }
    end
  end

  # GET /bluetooths/1
  # GET /bluetooths/1.json
  def show
    @bluetooth = Bluetooth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @bluetooth }
    end
  end

  # GET /bluetooths/new
  # GET /bluetooths/new.json
  def new
    @bluetooth = Bluetooth.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bluetooth }
    end
  end

  # GET /bluetooths/1/edit
  def edit
    @bluetooth = Bluetooth.find(params[:id])
  end

  # POST /bluetooths
  # POST /bluetooths.json
  def create
    @bluetooth = Bluetooth.new(params[:bluetooth])

    respond_to do |format|
      if @bluetooth.save
        format.html { redirect_to @bluetooth, :notice => 'Bluetooth was successfully created.' }
        format.json { render :json => @bluetooth, :status => :created, :location => @bluetooth }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bluetooth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bluetooths/1
  # PUT /bluetooths/1.json
  def update
    @bluetooth = Bluetooth.find(params[:id])

    respond_to do |format|
      if @bluetooth.update_attributes(params[:bluetooth])
        format.html { redirect_to @bluetooth, :notice => 'Bluetooth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bluetooth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bluetooths/1
  # DELETE /bluetooths/1.json
  def destroy
    @bluetooth = Bluetooth.find(params[:id])
    @bluetooth.destroy

    respond_to do |format|
      format.html { redirect_to bluetooths_url }
      format.json { head :no_content }
    end
  end
end
