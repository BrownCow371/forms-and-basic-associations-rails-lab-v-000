class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def notes_values=(values)
    values.each do |value|
      new_note = Note.new(content: value)
      self.notes << new_note if (value != "" && value != nil)
    end
  end

end
