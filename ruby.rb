require 'csv'
i = 0;
name = Array.new; score = Array.new; color = Array.new;
data = CSV.foreach('data.csv') do |values|
	if i!=0
		name[i-1] = values[0].downcase.gsub(/.\b/) { |m| m.upcase }
		score[i-1] = values[1].delete(',').to_i
		color[i-1] = values[2]
	end
	i = i + 1;
end
def most_common_value(input)
  input.group_by do |e|
    e
  end.values.max_by(&:size).first
end
def least_common_value(input)
  input.group_by do |e|
    e
  end.values.min_by(&:size).first
end
average = score.reduce(:+).to_f / score.size
puts "The highest score is:#{score.max}.\nThe lowest score is:#{score.min}.\nThe average score is:#{average}.\nMost common color is #{most_common_value(color)} and least common is #{most_common_value(color)}\n#{name}"