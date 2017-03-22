class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @activity = Activity.find(params[:activity_id])
    @applications = @activity.applications
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  	activity = Activity.find(params[:activity_id])
  	@application = activity.applications.find(params[:id])
  end

  # GET /applications/new
  def new
    activity = Activity.find(params[:activity_id])
    @application = activity.applications.build
    @students = current_user.userable.students.where(["year >= ? and year <= ?", activity.StartClassSuitability, activity.EndClassSuitability])
  end

  # GET /applications/1/edit
  def edit
  	activity = Activity.find(params[:activity_id])
  	@students = current_user.userable.students.where(["year >= ? and year <= ?", activity.StartClassSuitability, activity.EndClassSuitability])
  	@application = activity.applications.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
  	activity = Activity.find(params[:activity_id])
  	@students = current_user.userable.students.where(["year >= ? and year <= ?", activity.StartClassSuitability, activity.EndClassSuitability])
  	
    @application = activity.applications.create(application_params)
    

    respond_to do |format|
     
      if @application.save
        format.html { redirect_to(activity_applications_path, :notice => 'Application was successfully created.') }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
  	activity = Activity.find(params[:activity_id])
  	@students = current_user.userable.students.where(["year >= ? and year <= ?", activity.StartClassSuitability, activity.EndClassSuitability])
  	@application = activity.applications.find(params[:activity_id])
  	@students = current_user.userable.students
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to (activity_applications_path), notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
  	activity = Activity.find(params[:activity_id])
  	@application = activity.applications.find(params[:id])
    @application.destroy
    respond_to do |format|
      format.html { redirect_to activity_applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:student_id, :activity_id)
    end
    
    
    	
end

def activity_full?(activity, applications)
    	applications.size < activity.NoOfChildren
    end
