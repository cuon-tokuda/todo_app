require 'rails_helper'

RSpec.describe Task, type: :model do
  it "タスク名が取得できること" do
    task = Task.new(name: "todo app")
    expect(task.disp_name).to eq "todo appです"
  end
end




