puts "destroying all"

Artist.destroy_all
Song.destroy_all
User.destroy_all
Playlist.destroy_all

puts "creating default user"

default_user = User.create(name: "default", login: "testbot", password: "test1234")

puts "creating initial songs"

sound_of_silence = Song.create(name: "Sound of Silence", genre: "alt-rock")
high_high_hopes = Song.create(name: "High High Hopes", genre: "pop")
nowhere_generation = Song.create(name: "Nowhere Generation", genre: "rock")
down_with_the_sickness = Song.create(name: "Down with the Sickness", genre: "rock")

puts "creating initial artists"

disturbed = Artist.create(name: "Disturbed")
panic_at_the_disco = Artist.create(name: "Panic at the Disco")
rise_against = Artist.create(name: "Rise Against")

puts "creating initial playlists"

all_songs = Playlist.create(name: "All Songs")
rock = Playlist.create(name: "Rock")

puts "forming associations"

default_user.songs << sound_of_silence
default_user.songs << high_high_hopes
default_user.songs << nowhere_generation
default_user.songs << down_with_the_sickness

default_user.playlists << all_songs
default_user.playlists << rock

disturbed.songs << sound_of_silence
disturbed.songs << down_with_the_sickness

panic_at_the_disco.songs << high_high_hopes

rise_against.songs << nowhere_generation

all_songs.songs << high_high_hopes
all_songs.songs << nowhere_generation
all_songs.songs << down_with_the_sickness
all_songs.songs << sound_of_silence

rock.songs << nowhere_generation
rock.songs << down_with_the_sickness
rock.songs << sound_of_silence

puts "Done"

