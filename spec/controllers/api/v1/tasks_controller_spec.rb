require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  # index action
  describe 'GET index' do
    subject { get :index, format: :json }

    it { is_expected.to have_http_status(:ok) }

    context 'when there are not tasks' do
      it { expect(subject.body).to eq('[]') }
    end

    context 'when there are tasks' do
      let!(:tasks) { create_list(:task, 10) }

      it { expect(subject.body).to eq(Task.all.to_json) }
    end
  end

  # create action
  describe 'POST #create' do
    subject { post :create, format: :json, params: params }

    context 'when params are correct' do
      let(:params) do
        {
          task:
            {
              title: Faker::Hacker.say_something_smart,
              description: Faker::Hacker.adjective,
              time: Faker::Number.number(digits: 3)
            }
        }
      end

      it 'status should be' do
        expect(subject.status).to eq(201)
      end

      it 'when params are correct' do
        expect(subject.body).to eq(Task.last.to_json)
      end
    end
  end

  # update action
  describe 'PATCH #update' do
    subject { put :update, format: :json, params: params }

    context 'when user exist in database' do
      let(:task) { create(:task) }
      let(:params) { { id: task.id, task: { title: 'New name' } } }

      it { is_expected.to have_http_status(:ok) }

      it { expect(subject.body).to include('New name') }
    end
  end

  # destroy action
  describe 'GET destroy' do
    subject { delete :destroy, format: :json, params: params }

    context 'when user exist in database' do
      let(:task) { create(:task) }
      let(:params) { { id: task.id } }

      it 'status should be' do
        expect(subject.status).to eq(204)
      end
    end
  end
end
