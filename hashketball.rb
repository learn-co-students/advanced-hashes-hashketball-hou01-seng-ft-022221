require 'pry'

# Write your code below game_hash
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

# Write code here
def num_points_scored(player_name)
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if value[:players][inner_index][:player_name] == player_name
        return value[:players][inner_index][:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if value[:players][inner_index][:player_name] == player_name
        return value[:players][inner_index][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    if value[:team_name] == team_name
     return value[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |key, value|
    teams.push(value[:team_name])
  end
  return teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
      value[:players].each_with_index do |inner_key, inner_index|
        numbers.push(value[:players][inner_index][:number])
      end
    end
  end
  return numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if value[:players][inner_index][:player_name] == player_name
        stats.merge!(value[:players][inner_index])
      end
    end
  end
  return stats
end

def big_shoe_rebounds
  big_shoe = 0
  player_with_big_shoe = ""
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if big_shoe < value[:players][inner_index][:shoe]
        big_shoe = value[:players][inner_index][:shoe]
        player_with_big_shoe = value[:players][inner_index][:player_name]
      end
    end
    value[:players].each_with_index do |inner_key, inner_index|
      if value[:players][inner_index][:player_name] == player_with_big_shoe
        return value[:players][inner_index][:rebounds]
      end
    end
  end
end

# Bonus Questions
def most_points_scored
  points_scored = 0
  player_with_most_points = ""
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if points_scored < value[:players][inner_index][:points]
        points_scored = value[:players][inner_index][:points]
        player_with_most_points = value[:players][inner_index][:player_name]
      end
    end
  end
  puts player_with_most_points
end

def winning_team
  home_points = 0
  home_name = "Brooklyn Nets"
  away_points = 0
  away_name = "Charlotte Hornets"
  game_hash.each do |key, value|
    if value[:team_name] == home_name
      value[:players].each_with_index do |inner_key, inner_index|
        home_points += value[:players][inner_index][:points]
      end
    end
    if value[:team_name] == away_name
     value[:players].each_with_index do |inner_key, inner_index|
        away_points += value[:players][inner_index][:points]
      end
    end
  end
  if home_points > away_points
    puts home_name
  else
    puts away_name
  end
end

def player_with_longest_name
  player_names = []
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      player_names.push(value[:players][inner_index][:player_name])
    end
  end
  puts player_names.max_by(&:length)
end

# Super Bonus Question
def long_name_steals_a_ton?
  steals_scored = 0
  player_with_most_steals = ""
  player_names = []
  game_hash.each do |key, value|
    value[:players].each_with_index do |inner_key, inner_index|
      if steals_scored < value[:players][inner_index][:steals]
        steals_scored = value[:players][inner_index][:steals]
        player_with_most_steals = value[:players][inner_index][:player_name]
      end
    end
    value[:players].each_with_index do |inner_key, inner_index|
      player_names.push(value[:players][inner_index][:player_name])
    end
  end
  if player_names.max_by(&:length) == player_with_most_steals
    puts "true"
  else
    puts "false"
  end
end

# Testing Bonus Questions
most_points_scored

winning_team

player_with_longest_name

long_name_steals_a_ton?