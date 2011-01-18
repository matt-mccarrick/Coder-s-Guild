class Tutorial < ActiveRecord::Base
    attr_accessible :created_by, :title, :article, :upvotes, :downvotes
end
