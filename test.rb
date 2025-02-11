require 'pry'
def game_hash
  basketball_hash = {
    :home =>  {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3 , :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12 , :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3 , :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3 , :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4 , :blocks => 11, :slam_dunks => 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
				{:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2 , :blocks => 7, :slam_dunks => 2},
				{:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22 , :blocks => 15, :slam_dunks => 10},
				{:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4 , :blocks => 5, :slam_dunks => 5},
				{:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1 , :blocks => 1, :slam_dunks => 0},
				{:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7 , :blocks => 5, :slam_dunks => 12}
			]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, teamValues|
    teamValues.each do |attribute, data|
      if attribute == :players
        data.each do |stat|
          if stat[:player_name] == player_name
            return stat[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, teamValues|
    teamValues.each do |attribute, data|
      if attribute == :players
        data.each do |stat|
          if stat[:player_name] == player_name
            return stat[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
	game_hash.each do |locat, teamValues|
			if game_hash[locat].key?(:team_name) && game_hash[locat][:team_name] == team_name
			return game_hash[locat][:colors]
		end
	end
end

def team_names
  teamsarr = []
  game_hash.each do |locat, teamValues|
    teamValues.each do |attribute, data|
      if attribute == :team_name
        teamsarr << teamValues[attribute]
      end
    end
  end
  teamsarr
end


def player_numbers(team_name)
  jersey_nums =[]
  game_hash.each do |locat, teamValues|
    if game_hash[locat][:team_name] == team_name
      teamValues.each do |attributes, data|
        if attributes == :players
          for i in teamValues[:players]
            jersey_nums << i[:number]
          end
        end
      end
    end
  end
  jersey_nums
end

def player_stats(player_name)
new_hash = {}
game_hash.each do |locat, teamValues|
  teamValues.each do |attributes, data|
    if attributes == :players
      for i in teamValues[:players]
        if i[:player_name] == player_name
          new_hash = i
        end
      end
    end
  end
end
new_hash.delete(:player_name)
new_hash
end


def big_shoe_rebounds

end


def most_points_scored
  largest_pointv = 0
  player = nil
  game_hash.each do |locat, teamValues|
    teamValues.each do |attributes, data|
      if attributes == :players
        for i in teamValues[attributes]
          if i[:points] > largest_pointv
            largest_pointv = i[:points]
            player = i[:player_name]
          end
        end
      end
    end
  end
 player
end
