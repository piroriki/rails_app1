class TasksController < ApplicationController

 def index
  @tasks = Task.all #indexのみインスタンス変数が複数形、レコード全てのデータを取得させる
 end


 def new
  @task = Task.new
 end


 def create
  @task = Task.new(params.require(:task).permit(:title,:created_at,:finished_day,:is_all_day,:updated_at,:memo))
  
   if @task.save
    flash[notice:]="スケジュールを新規登録しました" #新規登録できたらメッセージ表示させる
    redirect_to task_path(@task.id)
   else
    render "new"
   end
 end


 def show
  @task = Task.find(params[:id])
 end


 def edit
  @task = Task.find(params[:id])
 end


 def update
  @task = Task.find(params[:id])
   if @task.update(params.require(:task).permit(:title,:created_at,:finished_day,:is_all_day,:updated_at,:memo))
    flash[:notice]="スケジュールの更新が完了しました" #更新できたらメッセージを表示させる
    redirect_to:tasks
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


 def time
  time = datetime.strftime("%Y年 %m月 %d日")
  @time = time
 end


end