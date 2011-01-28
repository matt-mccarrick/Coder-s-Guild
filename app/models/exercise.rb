class Exercise < ActiveRecord::Base
    attr_accessible :created_by, :section, :title, :article, :upvotes, :downvotes
end
