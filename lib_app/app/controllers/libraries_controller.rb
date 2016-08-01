class LibrariesController < ApplicationController
	
	def index
	@libraries = Library.all 
		render :index
	end  

	def new 
	@library = Library.new
		render :new
	end

	def create
	@library = Library.new(library_params)
	Library.create(params[:library])
	library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
	redirect_to "/libraries"
	end

	def edit
		library_id = params[:id]
		@library = Library.find_by_id(library_id)
		render :edit
	end

	def update
		library_id = params [:id]

		library = Library.find_by_id(library_id)
		library_params = params.require(:Library).permit(:name, :floor_count, :floor_area)

		library.update_attributes(library_params)

		redirect_to library_path(library)
	end

	def show
		library_id = params[:id]
		@library = Library.find_by_id(library_id)
		render :show
	end

	def destroy
		library_id = params[:id]
		library = Library.find_by_id(library_id)
		library.destroy
		redirect_to libraries_path
	end

	 private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def library_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
