class DateHospitalsController < ApplicationController
  def index
    @date_hospitals = DateHospital.includes(:user).order('date DESC, hospital_name')
  end

  def new
    @total_info = TotalInfo.new
  end

  def create
    @total_info = TotalInfo.new(total_info_params)
    if @total_info.valid?
      @total_info.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    date_hospital = DateHospital.find(params[:id])
    if date_hospital.user_id == current_user.id
      date_hospital.destroy
    end
    redirect_to root_path  
  end

  def upload
    require 'google/cloud/vision'
    binding.pry
    keyfile = ENV["GOOGLE_APPLICATION_CREDENTIALS"]
    project_id = ENV["GOOGLE_CLOUD_PROJECT"]
    image_annotator_client = Google::Cloud::Vision::ImageAnnotator.new project: project_id, keyfile: keyfile

    image = params[:image].path
    
    image_text = (image_annotator_client.document_text_detection image: image).to_s

    @date = image_text[/日付(.{0,3}\d+\.?\d+)/][/\d+\.?\d+/].to_f
    @hospital_name = image_text[/医療機関名(.+?)(日付|\z)/].strip
  
    @data = { date: @date, hospital_name: @hospital_name }

    respond_to do |format|
      format.html
      format.json
    end
  end


  private

  def total_info_params
    params.require(:total_info).permit(
      :date, :hospital_name, :user_id,
      medications: [:medicine_name, :timing, :individual, :days_supply, :notes]
    ).merge(user_id: current_user.id)
  end
  

end
