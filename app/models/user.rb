# ApplicationRecord is now the single point of entry for customizations to an application (instead of monkey-patching ActiveRecord::Base)
class User < ApplicationRecord
	has_secure_password
end
