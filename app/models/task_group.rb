class TaskGroup < ApplicationRecord
  belongs_to :user
  belongs_to :task

  HASH_VARIABLES = {
      gender: {"Male" => 0.5, "Female" => 0.5},
      age: {"Adult" => 0.6, "Children" => 0.4},
      nationality: {"English" => 0.25, "French" => 0.25, "Indian" => 0.25, "Japanese" => 0.25}
  }

  def self.return_group_information(n_users)
    messages = []
    messages << "Total users input: #{n_users}"
    final_parameters = TaskGroup.parameters(n_users)
    messages << "Total users output: #{final_parameters.inject(0){ |n, arr| n+arr[1] }}"
    messages << "In this case, the output would be #{final_parameters.count} ​task groups​, such as:"
    final_parameters.each do |final_params|
      messages << "Task group of #{final_params[1]} users who are #{final_params[0].values.join(", ")}"
    end
    messages
  end

  def self.return_group_users(n_users)
    final_paramters = TaskGroup.parameters(n_users)
    users = []
    final_paramters.each do |attributes|
      users += [User.where(attributes[0]).random_records(attributes[1], loop_limit: 30)]
    end
    users
  end

  private

    def self.parameters(n_users)
      main_parameters = TaskGroup.group_definer
      user_number = TaskGroup.group_divider(n_users)
      main_parameters.zip(user_number)
    end

    def self.group_definer
      main_keys = TaskGroup::HASH_VARIABLES.keys
      main_values = TaskGroup::HASH_VARIABLES.values.inject([]){|arr, nested_hash| arr << nested_hash.keys}
      first, *rest = main_values
      result = first.product(*rest)
      result.map{ |arr| main_keys.zip(arr).to_h }
    end

    def self.group_divider(n_users)
      first, *rest =  TaskGroup::HASH_VARIABLES.values.map{ |hash| hash.values }
      first.product(*rest).map{|result| (result.inject(:*)*n_users).ceil}
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
end
