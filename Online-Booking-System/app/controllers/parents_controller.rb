class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  def homepage
    if logged_in and  current_user.nil? and current_user.userable_type == "Parent"
         
      @cur_parent = Parent.find_by(id: user_id.userable_id )
      redirect_to  @cur_parent 
    else
      redirect_to login_url
    end
    
  end
  
  def show
    if logged_in and  current_user.nil? and current_user.userable_type == "Parent"
     
     
    else
      redirect_to login_url
    end
    
  end

  # GET /parents/new
  def new
	@parent
	if logged_in?
		flash[:alert] = "Already logged in"
		redirect_to root_url
	else
    	@parent = Parent.new
	@parent.build_user
	@parent.students << Student.new
	end
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)
    @parent.students.build
    @parent.students.each do |s|
		if s.nil?
			s.delete
		elsif s.first_name.blank? or s.first_name.nil?
			s.delete
		end		
	end
	respond_to do |format|
      if @parent.save and @parent.user.authenicated
		session[:user_id] = @parent.user.id
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      elsif(@parent.save and !@parent.user.authenicated)
       
			
	format.html { redirect_to root_url, notice: 'Parent was successfully created.Wait for authentication' }

	   else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent
    if logged_in? and  current_user.nil? and current_user.userable_type == "Parent"
      @parent = Parent.find_by(id: current_user.userable_id)   
       
    else
      redirect_to login_url
    end
    
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
	
      params.require(:parent).permit(:phone_num,user_attributes:[:first_name,:last_name,:email,:password,:password_confirmation],students_attributes:[:first_name,:last_name,:year])

	end

end
