require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def team(team_name)
  case team_name
  when game_hash[:home][:team_name]
    game_hash[:home]
  when game_hash[:away][:team_name]
    game_hash[:away]
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def home_team_points
  home_points = team("Brooklyn Nets")[:players].map { |points:, **| points }.sum
end

def away_team_points
  away_points = team("Charlotte Hornets")[:players].map { |points:, **| points }.sum
end

def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def get_player_by_name(player_name)
  all_players.find {|player| player[:player_name] == player_name}
end

def num_points_scored(player_name)
  get_player_by_name(player_name)[:points]
end

def shoe_size(player_name)
  get_player_by_name(player_name)[:shoe]
end

def player_with_largest_shoe(all_players)
  all_players.max { |p1, p2| p1[:shoe] <=> p2[:shoe] }
end

def player_with_most_points(all_players)
  all_players.max { |p1, p2| p1[:points] <=> p2[:points] }
end

def player_numbers(team_name)
  team(team_name)[:players].map { |number:, **| number }
end

def player_stats(player_name)
  get_player_by_name(player_name)
end

def big_shoe_rebounds
 player_with_largest_shoe(all_players)[:rebounds]
end

# Bonus Questions:

def most_points_scored
  player_with_most_points(all_players)[:player_name]
end

def winning_team
  if away_team_points > home_team_points
    return game_hash[:away][:team_name]
  else
    return game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_name = all_players.max { |p1, p2| p1[:player_name].length <=> p2[:player_name].length }
  longest_name[:player_name]
end
  