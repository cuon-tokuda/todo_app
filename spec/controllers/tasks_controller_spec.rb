require 'rails_helper'

RSpec.describe TasksController, type: :controller do
    let(:valid_attributes) { { name: 'Created task' } }
    let(:invalid_attributes) { { name: '' } }

    # index コントローラー
    describe "#index" do
    
        it "responds successfully" do
            get :index
            expect(response).to be_successful
        end
    end

    # show コントローラー
    describe "#show" do
        let(:task) { create(:task)}
        it "responds successfully" do
            get :show, params: {id: task.id}
            expect(response).to be_successful
        end
    end

    describe "#new" do
        it "responds successfully" do
            get :new
            expect(response).to be_successful
        end
    end

    describe "#edit" do
        let(:task) { create(:task)}
        it "responds successfully" do
            get :edit, params: {id: task.id}
            expect(response).to be_successful
        end
    end

    # create コントローラー
    describe 'POST #create' do
        # 正常系のテスト
        context '正常系' do
            subject { post :create, params: { task: valid_attributes } }

            it '適切なステータスコードが返ってくること' do
            subject
            expect(response).to have_http_status(:found)
            end

            it 'レコードが1つ増えること' do
            expect { subject }.to change(Task, :count).by(1)
            end

            it '作成されたレコードの値が意図したものになっていること' do
            subject
            expect(Task.last.attributes.symbolize_keys).to include(valid_attributes)
            end

            it 'redirect先が正しいこと' do
            subject
            expect(response).to redirect_to(Task.last)
            end
        end

        # 異常系のテスト
        context '異常系' do
            subject { post :create, params: { task: invalid_attributes } }

            it '適切なステータスコードが返ってくること' do
            subject
            expect(response).to have_http_status "422"
            end

            it 'レコードが増えないこと' do
            expect { subject }.not_to change(Task, :count)
            end

            it 'バリデーションエラーが発生すること' do
            subject
                expect(assigns(:task).errors.full_messages).to include("Name can't be blank")
            end

            it 'render先が正しいこと' do
            subject
            expect(response).to render_template(:new)
            end
        end
    end

    # PATCH#update コントローラー
    describe 'PATCH #update' do
        let(:task) { create(:task)}
        
        # 正常系のテスト
        context '正常系' do
            before do
            patch :update, params: { id: task.id, task: valid_attributes }
            end
        
            it '適切なステータスコードが返ってくること' do
            expect(response).to have_http_status(:found)
            end
        
            it 'レコードの値が意図した値に更新されていること' do
            task.reload
            expect(task.name).to eq('Created task')
            end
        
            it 'redirect先が正しいこと' do
            expect(response).to redirect_to(task_path(task))
            end
        end
        
        # 異常系のテスト
        context '異常系' do
        before { patch :update, params: { id: task.id, task: invalid_attributes } }
    
        it '適切なステータスコードが返ってくること' do
            expect(response).to have_http_status "422"
        end
    
        it 'レコードが更新されないこと' do
            original_task_name = task.name
            patch :update, params: { id: task.id, task: invalid_attributes }
            task.reload
            expect(task.name).to eq(original_task_name)
        end
    
        it 'render先が正しいこと' do
            expect(response).to render_template(:edit)
        end
        end

    end

    # DELETE#destroy コントローラー
    describe 'DELETE #destroy' do
        let!(:task) { create(:task)} # Create the task before running the tests
        subject { delete :destroy, params: { id: task.id } }
    
        it '適切なステータスコードが返ってくること' do
            subject
            expect(response).to have_http_status(:found)
        end

        it 'レコードが1つ減ること' do
            expect { subject }.to change(Task, :count).by(-1)
        end

        it 'redirect先が正しいこと' do
            subject
            expect(response).to redirect_to(root_path)
        end
    end

end