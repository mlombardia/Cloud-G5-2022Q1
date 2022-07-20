locals {

	user_group_name 		= "user_group"
	pool_name 					= "pool"
	identity_pool_name 	= "identity_pool"

	cognito_user_groups = {
		podcasters = {
			pool_name				= "podcasters-${local.pool_name}"
			user_group_name = "podcasters-${local.user_group_name}"
			identity_pool_name = "podcasters-${local.identity_pool_name}"
		}

		listeners = {
			pool_name				= "listeners-${local.pool_name}"
			user_group_name = "listeners-${local.user_group_name}"
			identity_pool_name = "listeners-${local.identity_pool_name}"
		}
	}
}