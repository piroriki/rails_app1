class TasksController < ApplicationController

 def index
  @tasks = Task.all #indexのみインスタンス変数が複数形、レコード全てのデータを取得させる
 end


 def new
  @task = Task.new
 end


 def create
  @task = Task.new(params.require(:task).permit(:title,:created_at,:finished_day,:is_all_day,:updated_at,:memo))

#新規登録画面で必須項目がない場合にエラーメッセージを表示する
   if @task.title.nil?
    flash[:alert] = "タイトルは必須項目です"
    render "new"

   elsif @task.created_at.nil?
    flash[:alert] = "スケジュール開始日は必須項目です"
    render "new"

   elsif @task.finished_day.nil?
    flash[:alert] = "スケジュール終了日は必須項目です"
    render "new" 

   elsif @task.save
    flash[notice:]="スケジュールを新規登録しました" #新規登録できたらメッセージ表示させる
    redirect_to task_path(@task.id)

   else
    render "new"
   end
 end


 def show
  @task = Task.find(params[:id])
  @tasks_count = Task.all.count
 end


 def edit
  @task = Task.find(params[:id])
 end


 def update
  @task = Task.find(params[:id])


#編集画面で必須項目を削除してしまった場合にエラーメッセージを表示する
   if @task.title.nil?
    flash[:alert] = "タイトルは必須項目です"
    render "edit"

   elsif @task.created_at.nil?
    flash[:alert] = "スケジュール開始日は必須項目です"
    render "edit"

   elsif @task.finished_day.nil?
    flash[:alert] = "スケジュール終了日は必須項目です"
    render "edit" 

   elsif @task.update(params.require(:task).permit(:title,:created_at,:finished_day,:is_all_day,:updated_at,:memo))
    flash[notice:]="スケジュールを更新しました" #更新できたらメッセージ表示させる
    redirect_to task_path(@task.id)

   else
    render "edit"

   end
 end


 def destroy
  @task = Task.find(params[:id])
  @task.destroy
  flash[:notice]="スケジュールの削除が完了しました" #削除が完了したらメッセージを表示させる
  redirect_to:tasks
 end


end