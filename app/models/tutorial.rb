class Tutorial < ActiveRecord::Base
	belongs_to :user
    attr_accessible :created_by, :section, :title, :article, :upvotes, :downvotes
end
