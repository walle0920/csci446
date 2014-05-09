atom_feed do |feed|
  feed.title "The parents that fostered the pets"
  feed.updated @fosters.maximum(:updated_at)
  @fosters.each do |post|
    feed.entry post do |entry|
      entry.title post.name
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Address: #{post.address}"
        xhtml.p "Email : #{post.email}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Name'
            xhtml.th 'Breed'
            xhtml.th 'picture'
          end
          @pet = Pet.find(post.pet_id)
          xhtml.tr do
            xhtml.td @pet.name
            xhtml.td @pet.breed
            xhtml.td image_tag(@pet.picture)
          end
        end

      end
      entry.author do |author|
        author.name "Fostering place"
      end
    end # end feed.entry
  end # end @fosteres.each
end