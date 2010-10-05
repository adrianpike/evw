class EntriesController < ApplicationController
	before_filter :authenticate_user!, :except => 'index'
	
	def index
		@entries = {}
		Entry::CATEGORIES.each {|c|
			@entries[c] = Entry.approved.all(:conditions => ['category = ?',c],:order => 'et asc')
		}
	end
	
	def new
		@entry = Entry.new
	end
	
	def unapproved
		@entries = Entry.unapproved
	end
	
	def create
		@entry = Entry.create(params[:entry])
		@entry.user = current_user unless current_user.admin and (@entry.user or @entry.new_username)
		
		if @entry.save then
			redirect_to entries_path
		else
			render :new
		end
	end
	
	def show
		@entry = Entry.find(params[:id])
	end
	
	def approve
		@entry = Entry.find(params[:id])
		@entry.approver = current_user if current_user.admin
		@entry.save
		
		redirect_to @entry
	end
	
end
