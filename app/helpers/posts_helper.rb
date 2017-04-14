module PostsHelper
	def recentPosts(num=5)
		return Post.order(created_at: :desc).last(num)
	end
end
