# app/controllers/comments_controller.rb
class MembersController < ApplicationController
 before_action :load_target

 def index
   binding.pry
   @members = @target.members
 end

 def new
   @members = @target.members.new
 end

 def create
   @member = @target.members.new(member_params)
   if @member.save
     redirect_to @target, notice: "作成しました"
   else
     render :new
   end
 end

 private
   # URL から Staff か Developer を取得する
   # ex: /staffs/:id/members
   # ex: /developers/:id/members
   def load_target
     resource, id = request.path.split('/')[1, 2]
     @target = resource.singularize.classify.constantize.find(id)
   end

   # 他の方法
   # def load_taget
   #   klass = [Staff, Developer].detect { |c| params["#{c.name.underscore}_id"] }
   #   @target = klass.find(params["#{klass.name.underscore}_id"])
   # end

   def member_params
     params.require(:name, :age, :mail)
   end
end
