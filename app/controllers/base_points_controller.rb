class BasePointsController < ApplicationController

  def new
    @base_point = BasePoint.new
  end

  def create
    @base_point = BasePoint.new(base_params)
    if @base_point.save
      flash[:success] = "新しい拠点を追加しました。"
      redirect_to base_points_url
    else
      flash[:danger] = "登録に失敗しました。"
    end
  end

  def index
    @base_points = BasePoint.all
  end

  def edit
    @base_point = BasePoint.find(params[:id])
  end

  def update
    @base_point = BasePoint.find(params[:id])
    if @base_point.update(base_params)
      flash[:success] = "拠点番号#{@base_point.base_number}を更新しました。"
    else
      flash[:danger] = "拠点番号#{@base_point.base_number}の更新は失敗しました。<br>" + @base_point.errors.full.messages.join("<br>")
    end
      redirect_to base_points_url      
  end

  def show
  end

  def destroy
    @base_point = BasePoint.find(params[:id])
    @base_point.destroy    
    flash[:danger] = "拠点番号#{@base_point.base_number}のデータを削除しました。"
    redirect_to base_points_url
  end

  private
    def base_params
      params.require(:base_point).permit(:base_number, :base_name, :base_kind)
    end

end
