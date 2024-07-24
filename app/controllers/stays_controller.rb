# app/controllers/stays_controller.rb

class StaysController < ApplicationController
  def create
    absences = params[:absences]
    absences.each do |absence|
      studio = Studio.find_by(name: absence[:studio])
      next unless studio

      stays_to_create = []
      current_stays = studio.stays.order(:start_date)
      absence_start_date = Date.parse(absence[:start_date])
      absence_end_date = Date.parse(absence[:end_date])

      current_stays.each do |stay|
        if stay.end_date < absence_start_date || stay.start_date > absence_end_date
          stays_to_create << stay
        else
          if stay.start_date < absence_start_date
            stays_to_create << { start_date: stay.start_date, end_date: absence_start_date - 1 }
          end
          if stay.end_date > absence_end_date
            stays_to_create << { start_date: absence_end_date + 1, end_date: stay.end_date }
          end
        end
      end

      studio.stays.destroy_all
      stays_to_create.each do |new_stay|
        studio.stays.create!(new_stay)
      end
    end

    render json: { message: 'Stays updated successfully' }, status: :ok
  end
end
