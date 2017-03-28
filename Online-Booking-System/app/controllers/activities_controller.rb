class ActivitiesController < ApplicationController
	include SessionsHelper	
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
	@current_user = current_user
    @activities = Activity.all
  end

  # GET /activities/1	
  # GET /activities/1.json
  def show
	redirect_to login_url unless !current_user.nil? and current_user.authenticated?
  end

  # GET /activities/new
  	def new
		redirect_to login_url if current_user.nil? or !current_user.authenticated? or !current_user.admin?
		
		@activity = Activity.new if !current_user.nil? and current_user.authenticated? and current_user.admin?
		flash[:message] = "Invalid privileges for this action"	
 	end

  # GET /activities/1/edit
  def edit
	redirect_to root_url unless !current_user.nil? and current_user.admin? and current_user.authenticated?
  end

  # POST /activities
  # POST /activities.json
  def create
	uploaded_io = params[:activity][:picture]
	params[:activity][:image_link] = uploaded_io.original_filename
	File.open(Rails.root.join('app/assets','images',uploaded_io.original_filename),'wb') do |file|
	file.write(uploaded_io.read)
	end	
    @activity = Activity.new(activity_params)
    @teachers = User.where(["userable_type = ?", "Teacher"])   

    respond_to do |format|
      if @activity.save
      	activity_date = ActivityDate.new(activity_id: @activity.id,date: @activity.StartDate)
      	activity_date.save
      	activity_date = ActivityDate.new(activity_id: @activity.id,date: activity_date.date + 7)
      	while activity_date.date <= @activity.EndDate do
      		activity_date.save	
      		activity_date = ActivityDate.new(activity_id: @activity.id,date: activity_date.date + 7)
      	end
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
        
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        activityDates = ActivityDate.where(activity_id: @activity.id).all
        activityDates.destroy_all
        
        activity_date = ActivityDate.new(activity_id: @activity.id,date: @activity.StartDate)
      	activity_date.save
      	activity_date = ActivityDate.new(activity_id: @activity.id,date: activity_date.date + 7)
      	while activity_date.date <= @activity.EndDate do
      		activity_date.save	
      		activity_date = ActivityDate.new(activity_id: @activity.id,date: activity_date.date + 7)
      	end
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:ActivityName,:ResponsibleTeacher, :Description, :StartClassSuitability, :EndClassSuitability, :StartDate, :EndDate, :StartTime, :EndTime, :NoOfChildren,:image_link)
    end
    

    
    
end
