class Entry < ActiveRecord::Base
	
	CATEGORIES = ['east','west','international']
	CLASSES = ['turbo','n/a','hybrid']
	
	belongs_to :user
	belongs_to :approver, :class_name => 'User'
	
	validates_presence_of :user_id, :et, :trap, :tb_class, :category
	
	named_scope :unapproved, :conditions => 'approver_id is null'
	named_scope :approved, :conditions => 'approver_id is not null'
	
	before_validation_on_create :generate_new_user
	
	def new_username
		@new_username
	end
	
	def new_username=(un)
		@new_username = un
	end
	
	def self.totals(categories = CATEGORIES, classes = CLASSES, year=Time.current)
		self.all(:conditions => ['category in (?) and tb_class in (?) and raced_at > ? and raced_at < ?', categories.to_a,classes.to_a, year.at_beginning_of_year, year.at_beginning_of_year + 1.year]).sum{|e|
			e.points
		}
	end
	
	def points
		val = 180.9 + -10 * et
		if (val>0 and val<80) then
			val
		else
		   if (val>80) then
		        80
				else
		      0
		   end
		end
	end
	
	def generate_new_user
		if @new_username then
			if (not user_id) or user_id.blank? then
				u = User.find_or_create_by_username(@new_username)
				if u then
					self.user_id = u.id
					p u
				else
					errors.add(:base, u.errors)
				end
			else
				p user_id
				errors.add(:base, 'New username as well as existing one?')
				false
			end
		end
	end
	
end
