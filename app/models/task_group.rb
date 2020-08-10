class TaskGroup < ApplicationRecord
  belongs_to :user
  belongs_to :task

  HASH_VARIABLES = {
      gender: {"Male" => 0.5, "Female" => 0.5},
      age: {"Adult" => 0.6, "Children" => 0.4},
      nationality: {"English" => 0.25, "French" => 0.25, "Indian" => 0.25, "Japanese" => 0.25}
  }

  def self.return_group_information(n_users)
    parameters = TaskGroup.parameters(n_users)
    messages = []
    messages << "Total users input: #{n_users}"
    messages << "Total users output: #{parameters.inject(0){ |n, arr| n+arr[1] }}"
    messages << "In this case, the output would be #{parameters.count} ​task groups​, such as:"
    parameters.inject(messages){|arr, args| arr << "Task group of #{args[1]} users who are #{args[0].values.join(", ")}" }
  end

  def self.return_group_users(n_users)
    parameters = TaskGroup.parameters(n_users)
    users = []
    parameters.each do |args|
      users += [User.where(args[0]).random_records(args[1], loop_limit: 30)] if User.where(args[0]).present?
    end
    users
  end

  private

    def self.parameters(n_users)
      main_parameters = TaskGroup.query_arguments
      user_number = TaskGroup.number_of_user_per_group(n_users)
      main_parameters.zip(user_number) # Ex: => => [[{:gender=>"Male", :age=>"Adult", :nationality=>"English"}, 8], ...
    end

    def self.query_arguments
      main_keys = TaskGroup::HASH_VARIABLES.keys # Ex: => [:gender, :age, :nationality]
      main_values = TaskGroup::HASH_VARIABLES.values.inject([]){|arr, nested_hash| arr << nested_hash.keys} # Ex: => [["Male", "Female"], ["Adult", "Children"], ["English", "French", "Indian", "Japanese"]]
      first, *rest = main_values # => Ex: [["Male", "Female"], ["Adult", "Children"], ["English", "French", "Indian", "Japanese"]]
      result = first.product(*rest) # => Ex: [[0.5, 0.6, 0.25], [0.5, 0.6, 0.25], [0.5, 0.6, 0.25], ...
      result.map{ |arr| main_keys.zip(arr).to_h } # Ex: => [{:gender=>"Male", :age=>"Adult", :nationality=>"English"}, {:gender=>"Male", :age=>"Adult", :nationality=>"French"}...
    end

    def self.number_of_user_per_group(n_users)
      first, *rest =  TaskGroup::HASH_VARIABLES.values.map{ |hash| hash.values }  # Ex: => [[0.5, 0.5], [0.6, 0.4], [0.25, 0.25, 0.25, 0.25]]
      first.product(*rest).map{|result| (result.inject(:*)*n_users).ceil}         # Ex: => [8, 8, 8, 8, 5, 5, 5, 5, 8, 8, 8, 8, 5, 5, 5, 5]
    end
end










# def self.count_groups(hash, results = 1)
#   hash.each do |_, value|
#     if value.is_a?(Hash)
#       results *= value.length
#       count_groups(value, results)
#     end
#   end
#   results
# end