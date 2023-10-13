# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task1 = tasks(:one)
    @task2 = tasks(:two)
    @category_id = categories(:one).id
    generate_tokens
  end

  test 'should get index' do
    get tasks_url, as: :json
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url,
           params: { task: { author_id: @task1.author_id, deadline: @task1.deadline, description: @task1.description,
                             name: @task1.name, category_id: @category_id } },
           headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :created
  end

  test 'should show task' do
    get task_url(@task1), as: :json
    assert_response :success
  end

  test 'should show my tasks' do
    get my_tasks_url, headers: { Authorization: @customer_token }, as: :json
    assert_response :success
  end

  test 'should not show my tasks' do
    get my_tasks_url, as: :json
    assert_response :unauthorized
  end

  test 'should update task' do
    patch task_url(@task1),
          params: { task: { deadline: @task1.deadline, description: @task1.description,
                            name: @task1.name } }, headers: { Authorization: @customer_token }, as: :json
    assert_response :success
  end

  test 'should not update task' do
    patch task_url(@task2),
          params: { task: { deadline: @task2.deadline, description: @task2.description,
                            name: @task2.name } }, headers: { Authorization: @customer_token }, as: :json
    assert_response :forbidden
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task1), headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :no_content
  end

  test 'should not destroy task' do
    assert_no_difference('Task.count', -1) do
      delete task_url(@task1), as: :json
    end

    assert_response :unauthorized
  end

  test 'should not destory not owned task' do
    assert_no_difference('Task.count', -1) do
      delete task_url(@task2), headers: { Authorization: @customer_token }, as: :json
    end

    assert_response :forbidden
  end
end
