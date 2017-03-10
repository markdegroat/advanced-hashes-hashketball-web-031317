# Write your code here!
def game_hash
  {
    #first level
    :home => {
      #second level
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        #player names are keys to a hash that contains their stats
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      #second level
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        #player names are keys to a hash that contains their stats
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, hash|
    #puts location
    #puts game_hash[location][:players].keys
    if game_hash[location][:players].key?(player_name)
      return game_hash[location][:players][player_name][:points]
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, hash|
    #puts location
    #puts game_hash[location][:players].keys
    if game_hash[location][:players].key?(player_name)
      return game_hash[location][:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, hash|

    if game_hash[location][:team_name] == team_name

      return game_hash[location][:colors]
    end
  end
end

def team_names
  team_names_to_return = []
  game_hash.each do |location, hash|
    team_names_to_return << game_hash[location][:team_name]
  end
  team_names_to_return
end

def player_numbers(team_name)
  array_of_jersey_numbers = []
  game_hash.each do |location, hash|

    if game_hash[location][:team_name] == team_name
      game_hash[location][:players].each do |key, value|
        if game_hash[location][:players][key].key?(:number)
          #this means I found the number of the player
          array_of_jersey_numbers << game_hash[location][:players][key][:number]
        end
        #puts game_hash[location][:players][key]
      end
    end
  end
  array_of_jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |location, hash|
    #puts location
    #puts game_hash[location][:players].keys
    if game_hash[location][:players].key?(player_name)
      return game_hash[location][:players][player_name]
    end
  end
end

def big_shoe_rebounds
  max_shoe_size = 0
  max_shoe_size_player = ""
  max_shoe_size_player_location = :blank
  game_hash.each do |location, hash|
    game_hash[location][:players].each do |name, stats|
      if game_hash[location][:players][name][:shoe].to_i > max_shoe_size
        max_shoe_size = game_hash[location][:players][name][:shoe].to_i
        #puts max_shoe_size
        max_shoe_size_player = name
        #puts max_shoe_size_player
        max_shoe_size_player_location = location
      end
    end
  end
  return game_hash[max_shoe_size_player_location][:players][max_shoe_size_player][:rebounds]
end


# puts num_points_scored("Alan Anderson")
# puts shoe_size("Alan Anderson")
# puts team_colors("Brooklyn Nets")
# puts team_names(game_hash)
# puts player_numbers("Brooklyn Nets")
# puts player_stats("Alan Anderson")
# puts big_shoe_rebounds(game_hash)
