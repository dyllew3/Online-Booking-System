class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
	@user = User.find_by(id:session[:user_id]) || false
	if @user != false and @user.admin? and @user.authenticated?
	
    @teachers = Teacher.all
	else redirect_to ("/teachers/" + session[:user_id].to_s)
	end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def homepage 
	@user = User.find_by(id: session[:user_id])
   	redirect_to login_url unless !@user.nil? and @user.userable_type == "Teacher"
   end

  # GET /teachers/new
  def new
	@teacher = nil

	
	@user = User.find_by(id: session[:user_id])
	if(@user.nil?)
		redirect_to login_url
		return 0
	end 
	if (@user.admin or @user.userable_type == "Teacher") and @user.authenticated?

    	@teacher = Teacher.new
		#@teacher.subjects = params[:subjects]
		@teacher.build_user
	else
	   redirect_to root_url 
	end



			
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    #@teacher.subjects = params[:teacher][:subjects].split(',')	
    respond_to do |format|
      if @teacher.save
		
		#user = User.find_by( userable_id:@teacher.id,userable_type:"Teacher")
		#session[:user_id] = user.id
		format.html{redirect_to root_path, notice: 'Teacher was  submitted for approval'}
        #format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        
		format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
    	params.require(:teacher).permit(:bio,user_attributes:[:first_name,:last_name,:email,:password,:password_confirmation])
    end
end
