class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  # def create
  #   @property = Property.new(property_params)
  #   @experts = Expert.where(city: @property.city, nb_sales: ..14)
  #   score_attr = 0
  #   @experts.each do |expert|
  #     if @property.price < 500_000
  #       score = expert.score_a
  #     elsif @property.price >= 500_000 && @property.price < 1_000_000
  #       score = expert.score_b
  #     else
  #       score = expert.score_c
  #     end
  #     expert_score = score * ((15 - expert.nb_sales).to_f / 15 * 2)
  #     if expert_score > score_attr
  #       @expert_max_score = expert
  #       score_attr = expert_score
  #     end
  #   end
  #   @property.expert = @expert_max_score
  #   @property.save
  #   redirect_to properties_path
  # end

  def create
    @property = Property.new(property_params)
    @experts = Expert.where(city: @property.city, nb_sales: ..14)
    scores = []
    score_expert = {}

    @experts.each do |expert|
      if @property.price < 500_000
        score = expert.score_a
      elsif @property.price >= 500_000 && @property.price < 1_000_000
        score = expert.score_b
      else
        score = expert.score_c
      end
      score_perf = score * ((15 - expert.nb_sales).to_f / 15 * 2)
      score_expert = { expert: expert, score: score_perf }
      scores << score_expert
    end
    scores.sort_by { |expert| expert[:score] }
    @property.expert = scores.first[:expert]
    @property.save
    redirect_to properties_path
  end

  def index
    @properties = Property.all.order(created_at: :desc)
  end

  private

  def property_params
    params.require(:property).permit(:city, :price)
  end
end
