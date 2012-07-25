xml.instruct!
xml.users {
	@users.each do |user|
		xml.user {
			xml.name user.name
			xml.twitter user.twitter
			xml.room "phd_office"
		}
	end
}