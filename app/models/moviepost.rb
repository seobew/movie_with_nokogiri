class Moviepost < ActiveRecord::Base
	mount_uploader :movieimage, MovieimageUploader
end
