require_relative "../types/todo_type"
require_relative "../../concepts/todo/operation/create"

module TodoMutations
  UpdateTodo = GraphQL::Relay::Mutation.define do
    name 'UpdateTodo'
    description 'Updates a Todo'
    input_field :title, types.String
    input_field :content, types.String

    return_field :todo, TodoType
    resolve -> (args, ctx) {

    }
  end

  CreateTodo = GraphQL::Relay::Mutation.define do
    name 'CreateTodo'
    description 'Creates a Todo'
    input_field :title, !types.String
    input_field :content, types.String

    return_field :todo, TodoType
    resolve -> (args, ctx) {
      result = Todo::Create.({
        title: args[:title],
        content: args[:content]
      })

      if result.success?
        {
          todo: result["model"]
        }
      else
        {error: "Something went wrong!"}
      end
    }
  end
end
