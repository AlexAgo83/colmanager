# db/seeds.rb

studio1 = Studio.create!(name: 'Studio 1')
studio2 = Studio.create!(name: 'Studio 2')

Stay.create!(studio: studio1, start_date: '2024-01-01', end_date: '2024-01-08')
Stay.create!(studio: studio1, start_date: '2024-01-16', end_date: '2024-01-24')
Stay.create!(studio: studio2, start_date: '2024-01-05', end_date: '2024-01-10')
Stay.create!(studio: studio2, start_date: '2024-01-15', end_date: '2024-01-20')
Stay.create!(studio: studio2, start_date: '2024-01-21', end_date: '2024-01-25')
