# app/controllers/studios_controller.rb

class StudiosController < ApplicationController
  def index
    absences = Studio.all.map do |studio|
      {
        studio: studio.name,
        absences: calculate_absences(studio)
      }
    end
    render json: absences
  end

  private

  def calculate_absences(studio)
    stays = studio.stays.order(:start_date)
    absences = []
    residence_start_date = Date.parse('2024-01-01')
    
    previous_end_date = residence_start_date - 1
    stays.each do |stay|
      if stay.start_date > previous_end_date + 1
        absences << { start_date: previous_end_date + 1, end_date: stay.start_date - 1 }
      end
      previous_end_date = stay.end_date
    end
    
    if previous_end_date < Date.today
      absences << { start_date: previous_end_date + 1, end_date: Date.today }
    end

    absences
  end
end
