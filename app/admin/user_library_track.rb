ActiveAdmin.register UserLibraryTrack do

 permit_params :song_id, :song_name, :song_artist, :song_attributes, :number_of_listens, :genre, :last_listened_to_date, :song_release_date, :liked

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
