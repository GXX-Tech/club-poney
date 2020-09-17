class GroupsPoniesController < ApplicationController
	def new
      @ponies = Pony.all
      @groups = Group.all
  		@groups_pony = GroupsPony.new
  end

  def create
 		@groups_pony = GroupsPony.new(groups_pony_params)
    @ponies = Pony.all
    @groups = Group.all

 		if @groups_pony.save
 			redirect_to :controller => 'groups', :action => 'index'
 		else
 			render :action => 'new'
 		end
  end
  
  def groups_pony_params
  	params.require(:groups_pony).permit(:pony_id, :group_id)
  end

  def edit
  	@groups_pony = GroupsPony.find(params[:id])
  end

  def update
   	@groups_pony = GroupsPony.find(params[:id])

   	if @groups_pony.update_attributes(groups_pony_param)
    	redirect_to :action => 'show', :id => @groups_pony
   	else
    	render :action => 'edit'
   	end
	end

	def delete
   		GroupsPony.find(params[:id]).destroy
   		redirect_to :action => 'index'
	end
end